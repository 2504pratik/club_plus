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
                  SizedBox(height: 20), // Adjust spacing
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Card 1',
                          description: 'This is the first card',
                           backgroundImagePath: 'images/swimming.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Card 2',
                          description: 'This is the second card', 
                          backgroundImagePath: 'images/hiking.jpg',
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
                          title: 'Card 3',
                          description: 'This is the third card',
                           backgroundImagePath: 'images/running.jpg',
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: CardWidget(
                          title: 'Card 4',
                          description: 'This is the fourth card',
                           backgroundImagePath: 'images/cycling.png',
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

  const CardWidget({Key? key, required this.title, required this.description, required String backgroundImagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(16.0),
        width: 150,
        height: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              title,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
