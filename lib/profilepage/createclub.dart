import 'package:flutter/material.dart';

import '../models/challenge.dart';
import '../models/club.dart';
import '../models/user.dart';

// ignore: must_be_immutable
class CreateClub extends StatelessWidget {
  final User user; // Declare user object

  CreateClub({super.key, required this.user}); // Constructor

  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Club'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enter club name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Club Name',
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Enter club description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Club Description',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // Call createClub function with user object and text field values
                  Club newClub = createClub(
                      nameController.text, descriptionController.text, user);
                  // Navigate back to ProfilePage
                  Navigator.pop(context);

                  print(newClub.clubName);
                  print(newClub.members);
                },
                child: const Text('Create Club'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Function to create a new club
Club createClub(String name, String description, User creator) {
  String clubId = generateId(); // Generate a unique ID for the club
  List<User> members = [creator]; // Initially, only the creator is a member
  List<Challenge> challenges = []; // Initially, there are no challenges

  Club newClub = Club(
    clubId: clubId,
    clubName: name,
    description: description,
    members: members,
    challenges: challenges,
  );

  // Add the creator to the club's members list
  creator.clubs.add(newClub);

  return newClub;
}

// Function to generate a unique ID (you can replace this with your own ID generation logic)
String generateId() {
  // Example: generating a random string of characters
  String characters = 'abcdefghijklmnopqrstuvwxyz0123456789';
  String randomId = '';

  for (int i = 0; i < 10; i++) {
    randomId +=
        characters[DateTime.now().millisecondsSinceEpoch % characters.length];
  }

  return randomId;
}
