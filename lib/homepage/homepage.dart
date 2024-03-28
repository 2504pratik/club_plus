import 'package:club_plus/homepage/challenge_box.dart';
import 'package:club_plus/models/challenge.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    var challenge1 = Challenge(
      1,
      "Challenge 1",
      DateTime(2024, 4, 1),
      DateTime(2024, 4, 1, 8, 0),
      DateTime(2024, 4, 7),
      DateTime(2024, 4, 7, 18, 0),
      ActivityType.running,
      "Description for Challenge 1",
      false,
    );

    var challenge2 = Challenge(
      2,
      "Challenge 2",
      DateTime(2024, 4, 10),
      DateTime(2024, 4, 10, 9, 30),
      DateTime(2024, 4, 15),
      DateTime(2024, 4, 15, 17, 30),
      ActivityType.cycling,
      "Description for Challenge 2",
      true,
    );

    var challenge3 = Challenge(
      3,
      "Challenge 3",
      DateTime(2024, 4, 20),
      DateTime(2024, 4, 20, 7, 0),
      DateTime(2024, 4, 25),
      DateTime(2024, 4, 25, 16, 0),
      ActivityType.hiking,
      "Description for Challenge 3",
      false,
    );

    var challenge4 = Challenge(
      4,
      "Challenge 4",
      DateTime(2024, 4, 28),
      DateTime(2024, 4, 28, 10, 0),
      DateTime(2024, 5, 3),
      DateTime(2024, 5, 3, 15, 45),
      ActivityType.swimming,
      "Description for Challenge 4",
      true,
    );
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
                      Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: 4, // Since you have 4 challenges
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10.0,
                              mainAxisSpacing: 10.0,
                            ),
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              Challenge challenge;
                              switch (index) {
                                case 0:
                                  challenge = challenge1;
                                  break;
                                case 1:
                                  challenge = challenge2;
                                  break;
                                case 2:
                                  challenge = challenge3;
                                  break;
                                case 3:
                                  challenge = challenge4;
                                  break;
                                default:
                                  throw Exception('Invalid index: $index');
                              }
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
                                title: challenge.challengeTitle,
                                description: challenge.desc,
                                backgroundImagePath: imagePath,
                              );
                            },
                          )),
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
