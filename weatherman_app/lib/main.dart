import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weatherman_app/pages/splash_screen.dart';
import 'package:weatherman_app/theme_manager.dart';

void main() {
  return runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(),
      child: Application(),
    ),
  );
}

class Application extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeNotifier>(
      builder: (context, theme, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: theme.getTheme(),
        home: SplashScreen(),
      ),
    );
  }
}
