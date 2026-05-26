import 'package:cipher_decoder/utils/app_routes.dart';
import 'package:cipher_decoder/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const CipherDecoderApp());
}

class CipherDecoderApp extends StatelessWidget {
  const CipherDecoderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Cipher Decoder',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'monospace',
        colorScheme: const ColorScheme.dark(
          primary: terminalWhite,
          onPrimary: terminalBlack,
          secondary: terminalWhite,
          onSecondary: terminalBlack,
          surface: terminalBlack,
          onSurface: terminalWhite,
          error: terminalError,
        ),
        scaffoldBackgroundColor: terminalBlack,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: terminalWhite,
            fontSize: 22,
            fontWeight: FontWeight.w900,
            fontFamily: 'monospace',
            letterSpacing: 2,
          ),
          iconTheme: IconThemeData(color: terminalWhite),
        ),
        cardTheme: CardThemeData(
          color: terminalBlack,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: const BorderSide(color: terminalWhite, width: 1),
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: terminalBlack,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: terminalWhite, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: terminalWhite, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(4),
            borderSide: const BorderSide(color: terminalWhite, width: 2),
          ),
          labelStyle: const TextStyle(color: terminalWhite, fontFamily: 'monospace'),
          hintStyle: const TextStyle(color: terminalMidGrey, fontFamily: 'monospace'),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: terminalWhite,
            foregroundColor: terminalBlack,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
              side: const BorderSide(color: terminalWhite, width: 1),
            ),
            textStyle: const TextStyle(
              fontFamily: 'monospace',
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        ),
        textTheme: const TextTheme(
          displayLarge: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          displayMedium: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          displaySmall: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          headlineLarge: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          headlineMedium: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          headlineSmall: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          titleLarge: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          titleSmall: TextStyle(fontFamily: 'monospace', color: terminalWhite, fontWeight: FontWeight.bold),
          bodyLarge: TextStyle(fontFamily: 'monospace', color: terminalWhite),
          bodyMedium: TextStyle(fontFamily: 'monospace', color: terminalWhite),
          bodySmall: TextStyle(fontFamily: 'monospace', color: terminalWhite),
          labelLarge: TextStyle(fontFamily: 'monospace', color: terminalWhite),
          labelMedium: TextStyle(fontFamily: 'monospace', color: terminalWhite),
          labelSmall: TextStyle(fontFamily: 'monospace', color: terminalWhite),
        ),
        tabBarTheme: const TabBarThemeData(
          labelColor: terminalBlack,
          unselectedLabelColor: terminalWhite,
          indicator: BoxDecoration(
            color: terminalWhite,
          ),
          labelStyle: TextStyle(fontFamily: 'monospace', fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontFamily: 'monospace'),
        ),
      ),
      initialRoute: AppRoutes.InitialRoute,
      getPages: AppRoutes.pages,
    );
  }
}

