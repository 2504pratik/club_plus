import 'package:club_plus/profilepage/custom_box.dart';
import '../models/user.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'createclub.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final User user = User(userId: '1', userName: 'Pratik', clubs: []);

  // Future<void> fetchAthleteData() async {
  //   try {
  //     final response =
  //         await http.get(Uri.parse('http://10.0.2.2:5000/athlete'));
  //     if (response.statusCode == 200) {
  //       final userData = json.decode(response.body);
  //       setState(() {
  //         user = User(
  //           userId: userData['id'],
  //           userName: '${userData['firstname']} ${userData['lastname']}',
  //           userProfile: userData['profile'],
  //         );
  //       });
  //     } else {
  //       // Handle error
  //       print('Failed to fetch athlete data: ${response.statusCode}');
  //     }
  //   } catch (error) {
  //     // Handle error
  //     print('Failed to fetch athlete data: $error');
  //   }
  // }

  // Function to handle logout
  Future<void> _logout(BuildContext context) async {
    // Make HTTP request to logout endpoint
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/logout'));
    if (response.statusCode == 200) {
      // Redirect user to login page
      Navigator.pushNamed(context, '/login');
    } else {
      // Handle error
      print('Failed to logout: ${response.reasonPhrase}');
    }
  }

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
                const CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 30.0,
                    // ignore: unnecessary_null_comparison
                    backgroundImage: AssetImage('images/user_icon.png')),
                const SizedBox(width: 10.0),
                Text(
                  user.userName, // Display the user name if available, otherwise display 'Loading...'
                  style: const TextStyle(
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
                          child: Center(
                            child: GestureDetector(
                              onTap: () {
                                // Navigate to CreateClubPage and pass user object
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        CreateClub(user: user),
                                  ),
                                );
                              },
                              child: const Text(
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
                          child: Center(
                            child: GestureDetector(
                              onTap: () => _logout(context),
                              child: const Text(
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
