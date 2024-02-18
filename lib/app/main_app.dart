import 'package:flutter/material.dart';
import 'package:travel_app/features/trip/presentation/pages/main_screen.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}