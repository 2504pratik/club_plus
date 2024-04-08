import 'package:flutter/material.dart';

Widget ChallengeBox(String title, String desc, String imagePath) {
  return Card(
    child: Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white, // Adjust the text color if needed
              ),
            ),
            const SizedBox(height: 5),
            Text(
              desc,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white, // Adjust the text color if needed
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
