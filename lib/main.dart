import 'package:flutter/material.dart';
import 'package:voice_assistant/theme/pallete.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Allen',
      theme: ThemeData.light( useMaterial3: true).copyWith(
        scaffoldBackgroundColor: Pallete.whiteColor ,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          color: Pallete.whiteColor ,
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeScreen(),
    );
  }
}


