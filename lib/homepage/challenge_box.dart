import 'package:flutter/material.dart';

class ChallengeBox extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImagePath;

  const ChallengeBox({
    super.key,
    required this.title,
    required this.description,
    required this.backgroundImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(backgroundImagePath),
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
                description,
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
}
