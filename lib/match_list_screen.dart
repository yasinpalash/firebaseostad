import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MatchListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Match List'),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('matches').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return CircularProgressIndicator();
          }
          var matches = snapshot.data?.docs;
          return ListView.builder(
            itemCount: matches?.length,
            itemBuilder: (context, index) {
              var match = matches?[index];
              return ListTile(
                title: Text(match?['team1'] + ' vs ' + match?['team2']),
                onTap: () {
                  Navigator.pushNamed(context, '/matchDetails', arguments: {
                    'team1': match?['team1'],
                    'team2': match?['team2'],
                    'goals1': match?['goals1'],
                    'goals2': match?['goals2'],
                    'time': match?['time'],
                    'totalTime': match?['totalTime'],
                    // Add other match details as needed
                  });
                },
                trailing: const Icon(Icons.arrow_forward),
              );
            },
          );
        },
      ),
    );
  }
}
