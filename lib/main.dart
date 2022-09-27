import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app/domain/core/di/injectable.dart';
import 'package:netflix_app/presentation/main_page/screen_main.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureInjection();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'netflix wanna be😑',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.black,
        fontFamily: GoogleFonts.montserrat().fontFamily,
        backgroundColor: Colors.black,
        textTheme: TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: ScreenMainPage(),
    );
  }
}
