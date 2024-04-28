import 'package:club_plus/homepage/challenge_box.dart';
import 'package:club_plus/models/challenge.dart';
import 'package:club_plus/profilepage/profilepage.dart';
import 'package:flutter/material.dart';

import 'dart:convert';

import '../models/user.dart';

class HomePage extends StatelessWidget {
  final User user;
  const HomePage({super.key, required this.user});

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
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Hello ${user.firstName}',
                                  style: const TextStyle(
                                    color: Color(0xFF200E32),
                                    fontSize: 48,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                                const Text(
                                  'Welcome to Club+',
                                  style: TextStyle(
                                    color: Color(0xFF8F8698),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        ProfilePage(user: user),
                                  ),
                                );
                              },
                              child: CircleAvatar(
                                backgroundColor: const Color(0xFF200E32),
                                backgroundImage:
                                    NetworkImage(user.profilePicUrl),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      FutureBuilder(
                        future: DefaultAssetBundle.of(context)
                            .loadString('assets/Challenges.JSON'),
                        builder: (context, AsyncSnapshot<String> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          if (snapshot.hasError) {
                            return Center(
                              child: Text(
                                  'Error loading challenges: ${snapshot.error}'),
                            );
                          }
                          if (!snapshot.hasData || snapshot.data!.isEmpty) {
                            return Container(); // No data yet, return empty container
                          }

                          var challengesData = json.decode(snapshot.data!)
                              as Map<String, dynamic>;

                          var challenges =
                              (challengesData['challenges'] as List)
                                  .map((challengeJson) =>
                                      Challenge.fromJson(challengeJson))
                                  .toList();

                          return Padding(
                            padding: const EdgeInsets.only(right: 16),
                            child: GridView.builder(
                              shrinkWrap: true,
                              itemCount: challenges.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 10.0,
                                mainAxisSpacing: 10.0,
                              ),
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                var challenge = challenges[index];
                                // Determine image path based on activity type
                                String imagePath;
                                switch (challenge.activityType) {
                                  case ActivityType.running:
                                    imagePath = 'images/running.jpg';
                                    break;
                                  case ActivityType.swimming:
                                    imagePath = 'images/swimming.jpg';
                                    break;
                                  case ActivityType.cycling:
                                    imagePath = 'images/cycling.jpg';
                                    break;
                                  case ActivityType.hiking:
                                    imagePath = 'images/hiking.jpg';
                                    break;
                                }
                                return ChallengeBox(
                                  challenge,
                                  imagePath,
                                );
                              },
                            ),
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
