import 'package:club_plus/profilepage/custom_box.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
          // Profile
          Positioned(
            top: width * 0.3,
            left: 20.0,
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Image.asset('images/user_icon.png'),
                ),
                const SizedBox(width: 10.0),
                const Text(
                  'User Name',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ],
            ),
          ),
          // Back Button Icon
          Positioned(
            top: 40.0,
            left: 20.0,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop(); // Handle back navigation
              },
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Scrollable box
          Positioned(
            top: width * 0.55,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0x26C78966),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomBox('Activities', 'images/ic_running.png'),
                    const SizedBox(height: 20),
                    CustomBox('Statistics', 'images/ic_statistics.png'),
                    const SizedBox(height: 20),
                    CustomBox('Goals', 'images/ic_goals.png'),
                    const SizedBox(height: 20),
                    CustomBox('Add Gear', 'images/ic_add.png'),
                    const SizedBox(height: 40),
                    // Create a club page
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'Create a club',
                              style: TextStyle(
                                color: Color(0xFF1E3D8A),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    // Log out button
                    Material(
                      borderRadius: BorderRadius.circular(10),
                      elevation: 8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          height: 50,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(12.0),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                          ),
                          child: const Center(
                            child: Text(
                              'Log out',
                              style: TextStyle(
                                color: Color(0xFF1E3D8A),
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
