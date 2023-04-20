import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tiktok_clone/common/widgets/config/video_config.dart';
import 'package:tiktok_clone/features/videos/view_models/playback_config_vm.dart';
import 'package:tiktok_clone/router.dart';

import 'constants/sizes.dart';
import 'features/videos/repos/video_playback_config_repo.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );

  final preferences = await SharedPreferences.getInstance();
  final repository = PlaybackConfigRepository(preferences);

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.dark,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PlaybackConfigViewModel(repository),
        ),
      ],
      child: const TikTokApp(),
    ),
  );
}

class TikTokApp extends StatelessWidget {
  const TikTokApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: darkModeConfig,
      builder: (context, value, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        title: 'TikTok Clone',
        themeMode: darkModeConfig.value ? ThemeMode.dark : ThemeMode.light,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en'),
          Locale('ko'),
          Locale("es"),
        ],
        theme: ThemeData(
          useMaterial3: true,
          brightness: Brightness.light,
          textTheme: Typography.blackMountainView,
          scaffoldBackgroundColor: Colors.white,
          primaryColor: const Color(0xFFE9435A),
          splashColor: Colors.transparent,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          appBarTheme: const AppBarTheme(
            foregroundColor: Colors.black,
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
            surfaceTintColor: Colors.white,
          ),
          tabBarTheme: TabBarTheme(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
          ),
          indicatorColor: Colors.black,
          listTileTheme: const ListTileThemeData(
            iconColor: Colors.black,
          ),
        ),
        darkTheme: ThemeData(
          useMaterial3: true,
          tabBarTheme: TabBarTheme(
            labelColor: Colors.white,
            unselectedLabelColor: Colors.grey.shade700,
          ),
          indicatorColor: Colors.white,
          bottomAppBarTheme: BottomAppBarTheme(
            color: Colors.grey.shade900,
          ),
          textTheme: Typography.whiteMountainView,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF121212),
          primaryColor: const Color(0xFFE9435A),
          splashColor: Colors.transparent,
          textSelectionTheme: const TextSelectionThemeData(
            cursorColor: Color(0xFFE9435A),
          ),
          appBarTheme: AppBarTheme(
            surfaceTintColor: Colors.grey.shade900,
            foregroundColor: Colors.white,
            backgroundColor: Colors.grey.shade900,
            elevation: 0,
            centerTitle: true,
            titleTextStyle: const TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16 + Sizes.size2,
              fontWeight: FontWeight.w600,
            ),
            actionsIconTheme: IconThemeData(
              color: Colors.grey.shade100,
            ),
          ),
        ),
      ),
    );
  }
}
