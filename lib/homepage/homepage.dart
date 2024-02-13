import 'dart:ui';

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // Background Circles
          Positioned(
            top: -width * 0.4,
            right: -width * 0.5,
            child: CircleAvatar(
              backgroundColor: const Color(0x336B66C7),
              radius: width * 0.45,
            ),
          ),
          Positioned(
            top: -width * 0.31,
            right: width * 0.3,
            child: CircleAvatar(
              backgroundColor: const Color(0x26C78966),
              radius: width * 0.30,
            ),
          ),
          // Scrollable Content
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, top: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello',
                                  style: TextStyle(
                                    color: Color(0xFF200E32),
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                Text(
                                  'Welcome to Club+',
                                  style: TextStyle(
                                    color: Color(0xFF8F8698),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            CircleAvatar(
                              backgroundColor: const Color(0xFF200E32),
                              child: Image.asset('images/user_icon.png'),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 20,
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable list scrolling to allow the outer scroll view to handle scrolling
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text('Item $index'),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
