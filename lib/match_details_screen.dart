import 'package:flutter/material.dart';

class MatchDetailsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Extract match details from the arguments
    final Map<String, dynamic> args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${args['team1']} vs ${args['team2']}',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: SizedBox(
        height: 200,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.only(left: 40),
          child: Card(
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  '${args['team1']} vs ${args['team2']}',
                  style: TextStyle(fontSize: 40),
                ),
                Text(
                  '${args['goals1']} : ${args['goals2']}',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Time:${args['time']} ',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  'Total Time:${args['totalTime']} ',
                  style: TextStyle(fontSize: 20),
                ),
                // Add other match details widgets here
              ],
            ),
          ),
        ),
      ),
    );
  }
}
