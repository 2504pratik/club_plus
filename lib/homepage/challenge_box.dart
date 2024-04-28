// ignore_for_file: must_be_immutable

import 'package:club_plus/models/challenge.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import 'challenge_details.dart';

class ChallengeBox extends StatelessWidget {
  Challenge challenge;
  String imagePath;
  ChallengeBox(this.challenge, this.imagePath, {super.key});

  String _formatDateRange(DateTime startDate, DateTime endDate) {
    String formattedStartDate = DateFormat('dd MMM').format(startDate);
    String formattedEndDate = DateFormat('dd MMM').format(endDate);
    return '$formattedStartDate - $formattedEndDate';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ChallengeDetailsPage(challenge)),
        );
      },
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Stack(
            children: [
              Image.asset(
                imagePath,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.4),
                      Colors.transparent,
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        challenge.challengeTitle,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        _formatDateRange(
                            challenge.startDate, challenge.endDate),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
