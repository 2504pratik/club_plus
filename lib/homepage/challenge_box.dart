// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ChallengeBox extends StatelessWidget {
  const ChallengeBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(
              top: -80,
              right: -120,
              child: Image.asset(
                'images/Group 39.png', // Replace 'image.png' with your image asset path
                width: 550,
                height: 300,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Welcome to My App',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 50), // Adjust spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Swimming',
                          description: '....',
                           backgroundImagePath: 'images/swimming.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Cycling',
                          description: '......', 
                          backgroundImagePath: 'images/cycling.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Hiking',
                          description: '...........',
                           backgroundImagePath: 'images/hiking.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Running',
                          description: '.......',
                           backgroundImagePath: 'images/running.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  final String title;
  final String description;
  final String backgroundImagePath;

  const CardWidget({
    Key? key,
    required this.title,
    required this.description,
    required this.backgroundImagePath,
  }) : super(key: key);

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
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                 // color: Colors.white, // Adjust the text color if needed
                ),
              ),
              SizedBox(height: 5),
              Text(
                description,
                style: TextStyle(
                  fontSize: 16,
                  //color: Colors.white, // Adjust the text color if needed
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
