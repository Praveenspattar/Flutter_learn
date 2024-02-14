import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Learn",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
        fontFamily: GoogleFonts.dmSans().fontFamily,
      ),
      home: const HomeView(),
    );
  }
}