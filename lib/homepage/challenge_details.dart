import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:club_plus/models/challenge.dart';
import 'package:provider/provider.dart';

import '../leaderboard/leaderboard.dart';
import '../providers/user_provider.dart';

class ChallengeDetailsPage extends StatelessWidget {
  final Challenge challenge;

  const ChallengeDetailsPage(this.challenge, {super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).currentUser;
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(
                        challenge.challengeTitle,
                        style: const TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        challenge.desc,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        _formatDateRange(
                            challenge.startDate, challenge.endDate),
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LeaderboardPage(
                        currentUser: currentUser,
                        challenge: challenge,
                      ),
                    ),
                  );
                },
                child: const Text('Accept Challenge'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDateRange(DateTime startDate, DateTime endDate) {
    String formattedStartDate = DateFormat('dd MMM').format(startDate);
    String formattedEndDate = DateFormat('dd MMM').format(endDate);
    return '$formattedStartDate - $formattedEndDate';
  }
}
