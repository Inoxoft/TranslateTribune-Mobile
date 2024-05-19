import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:translatetribune/src/configs/configs/get_it.dart';
import 'package:translatetribune/src/configs/router/app_router.dart';
import 'package:translatetribune/src/data/services/notifications.dart';

class Application extends StatefulWidget {
  const Application({
    super.key,
  });

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    switch (state) {
      case AppLifecycleState.resumed:
        getIt<NotificationsService>().checkAndSchedule();
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    );

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.instance.config(),
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaler: const TextScaler.linear(1.0),
          ),
          child: child ?? const SizedBox.shrink(),
        );
      },
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          foregroundColor: Colors.white,
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        highlightColor: Colors.transparent,
        splashColor: Colors.transparent,
        hoverColor: const Color(0xFFBFFD4D),
        focusColor: const Color(0xFF79BB00),
        primaryColor: const Color(0xFF1976D2),
        dividerColor: const Color(0xFF141414).withOpacity(0.2),
        indicatorColor: const Color(0xFF141414),
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          titleMedium: GoogleFonts.robotoMono(
            fontSize: 28.0,
            fontWeight: FontWeight.bold,
          ),
          titleSmall: GoogleFonts.robotoMono(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          bodyLarge: GoogleFonts.roboto(
            fontSize: 19.0,
            fontWeight: FontWeight.w400,
          ),
          bodySmall: GoogleFonts.roboto(
            fontSize: 12.0,
            fontWeight: FontWeight.w400,
          ),
        ).apply(
          bodyColor: const Color(0xFF141414),
          displayColor: const Color(0xFF818181),
        ),
      ),
    );
  }
}
