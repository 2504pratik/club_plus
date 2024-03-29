import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

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
  late String _redirectUrl; // Changed to nullable string

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
    fetchRedirectUrl();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Future<void> fetchRedirectUrl() async {
    try {
      final response = await http.get(Uri.parse('http://10.0.2.2:5000/login'));
      if (response.statusCode == 200) {
        setState(() {
          _redirectUrl = response.body;
        });
      } else {
        print('Failed to fetch redirect URL: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching redirect URL: $error');
    }
  }

  Future<void> launchUrl(String? url) async {
    if (url != null) {
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        print('Could not launch $url');
      }
    } else {
      print('Error: Redirect URL is null');
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                          onPressed: () {
                            launchUrl(_redirectUrl);
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
