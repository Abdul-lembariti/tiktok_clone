import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/common/widgets/video_config/video_config.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/videos/repository/videoplayback_repository.dart';
import 'package:tiktok_clone/features/videos/view_modal/playback_vm.dart';
import 'package:tiktok_clone/generated/l10n.dart';
import 'package:tiktok_clone/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp],
  );

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  final preferences = await SharedPreferences.getInstance();

  final repository = VideoPlayBackConfigRep(preferences);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlayBackConfigViewModal(repository),
        ),
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  @override
  Widget build(BuildContext context) {
    S.load(const Locale('es'));
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'Tiktok Clone',
      localizationsDelegates: const [
        S.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
        Locale('ko'),
      ],
      themeMode: themeConfig.value ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: Typography.blackMountainView,
        scaffoldBackgroundColor: Colors.white,
        bottomAppBarTheme: BottomAppBarTheme(
          color: Colors.grey.shade50,
        ),
        primaryColor: const Color(0xFFE9435A),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: Color(0xFFE9435A),
        ),
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          elevation: 0,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: Sizes.size20,
            fontWeight: FontWeight.bold,
          ),
        ),
        tabBarTheme: TabBarTheme(
          unselectedLabelColor: Colors.grey[500],
          labelColor: Colors.black,
          indicatorColor: Theme.of(context).primaryColor,
        ),
        listTileTheme: const ListTileThemeData(
          iconColor: Colors.black,
        ),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        tabBarTheme: TabBarTheme(
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.grey[700],
        ),
        textTheme: Typography.whiteMountainView,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.grey[900],
          surfaceTintColor: Colors.grey[900],
          actionsIconTheme: IconThemeData(
            color: Colors.grey[100],
          ),
          iconTheme: IconThemeData(
            color: Colors.grey[100],
          ),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.black,
        ),
        primaryColor: const Color(0xFFE9435A),
      ),
    );
  }
}
