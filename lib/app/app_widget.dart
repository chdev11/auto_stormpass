import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Slidy',
      darkTheme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
            backgroundColor: Color(0xFF16192B), foregroundColor: Colors.white),
        scaffoldBackgroundColor: const Color(0xFF0E101C),
        cardColor: const Color(0xFF16192B),
        dialogBackgroundColor: const Color(0xFF16192B),
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
      ),
      themeMode: ThemeMode.dark,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
