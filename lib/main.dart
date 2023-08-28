import 'package:flutter/material.dart';
import 'package:googlecloneflutter/colors.dart';
import 'package:googlecloneflutter/responsive/mobile_screen_layout.dart';
import 'package:googlecloneflutter/responsive/responsive_layout_screen.dart.dart';
import 'package:googlecloneflutter/responsive/web_screen_layout.dart';
import 'package:googlecloneflutter/screens/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Google Clone",
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const ResponsiveLayoutScreen(
        mobileScreenLayout: MobileScreenLayout(),
        webScreenLayout: WebScreenLayout(),
      ),
    );
  }
}
