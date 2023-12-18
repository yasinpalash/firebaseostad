import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'match_list_screen.dart';
import 'match_details_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MatchListScreen(),
        '/matchDetails': (context) => MatchDetailsScreen(),
      },
    );
  }
}
