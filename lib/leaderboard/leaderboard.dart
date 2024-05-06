import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:club_plus/models/user.dart';
import 'package:club_plus/models/challenge.dart';
import 'leaderboard_service.dart';

class LeaderboardPage extends StatelessWidget {
  final User? currentUser;
  final Challenge challenge;

  const LeaderboardPage({
    super.key,
    required this.currentUser,
    required this.challenge,
  });

  @override
  Widget build(BuildContext context) {
    final leaderboardService = Provider.of<LeaderboardService>(context);
    final leaderboardEntries =
        leaderboardService.getLeaderboardEntries(currentUser!, challenge);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Leaderboard'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: leaderboardEntries.length,
        itemBuilder: (context, index) {
          final entry = leaderboardEntries[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: index < 3 ? Colors.grey[200]!.withOpacity(0.3) : null,
            ),
            child: Row(
              children: [
                Text(
                  (index + 1).toString(),
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: index < 3 ? Colors.amber : Colors.black,
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.name,
                        style: const TextStyle(fontSize: 16.0),
                      ),
                      const SizedBox(height: 4.0),
                      LinearProgressIndicator(
                        value: entry.progress,
                        backgroundColor: Colors.grey[300],
                        valueColor: AlwaysStoppedAnimation(Colors.amber),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
