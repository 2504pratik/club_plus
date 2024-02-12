import 'dart:async';

import 'package:flutter/material.dart';

import 'login_function.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with AutomaticKeepAliveClientMixin {
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.0);
  Timer? _timer;
  int _currentPageIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(milliseconds: 2500), (Timer timer) {
      if (_pageController.hasClients) {
        if (_currentPageIndex == 3) {
          _currentPageIndex = 0;
        } else {
          _currentPageIndex++;
        }
        _pageController.animateToPage(
          _currentPageIndex,
          duration: const Duration(milliseconds: 1000),
          curve: Curves.ease,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(
        context); // Ensure that AutomaticKeepAliveClientMixin is properly called
    return Scaffold(
      body: Stack(
        children: [
          // Sliding background
          PageView(
            controller: _pageController,
            onPageChanged: (int index) {
              setState(() {
                _currentPageIndex = index;
              });
            },
            children: [
              Image.asset('images/cycling.jpg', fit: BoxFit.cover),
              Image.asset('images/hiking.jpg', fit: BoxFit.cover),
              Image.asset('images/running.jpg', fit: BoxFit.cover),
              Image.asset('images/swimming.jpg', fit: BoxFit.cover),
            ],
          ),
          Column(
            children: [
              // Club+ logo/text
              Padding(
                padding: EdgeInsets.only(
                    top: (MediaQuery.of(context).size.height) * 0.40),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Club",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 72,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "+",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 72,
                          fontWeight: FontWeight.w100),
                    )
                  ],
                ),
              ),
              // Slogan text
              Padding(
                padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    top: (MediaQuery.of(context).size.height) * 0.10),
                child: const Text(
                  "Connect, collaborate, and conquer challenges together.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 26,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Login button
              Padding(
                padding: EdgeInsets.only(
                    left: 64,
                    right: 64,
                    top: (MediaQuery.of(context).size.height) * 0.1),
                child: Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 50,
                        child: TextButton(
                          onPressed: () async {
                            // Call the loginWithStrava function to initiate the authentication flow
                            Map<String, dynamic> loginResult =
                                await LoginFunction.loginWithStrava();

                            if (loginResult['success']) {
                              // If authentication initiation is successful, launch the Strava authentication page
                              String authUrl = loginResult['authUrl'];
                              print(
                                  'Redirecting to Strava authentication page: $authUrl');
                              await LoginFunction.launchUrl(authUrl);
                            } else {
                              // Handle authentication initiation failure
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(loginResult['error']),
                                ),
                              );
                            }
                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Theme.of(context).primaryColor),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          ),
                          child: const Text(
                            "Get started",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Strava login text
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "*Log in through Strava account",
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
