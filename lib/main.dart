import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/signup.dart';
import 'package:tiktok_clone/features/tab_navigation/main_navigation.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  /*  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  ); */

  /*  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  ); */

  runApp(const TikTokApp());
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: const LayoutBulder(),
    );
  }
}

class LayoutBulder extends StatelessWidget {
  const LayoutBulder({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) => Container(
          width: constraints.maxWidth,
          height: constraints.maxHeight,
          color: Colors.amber,
          child: Center(
            child: Text(
              '${size.width} ${constraints.maxWidth}',
              style: const TextStyle(
                fontSize: 48,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
