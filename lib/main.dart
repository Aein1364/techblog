import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'view/SplashScreen.dart';
import 'component/Colors.dart';
import 'gen/fonts.gen.dart';

void main(List<String> args) {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        statusBarColor: SolidColors.scaffoldBg,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: SolidColors.scaffoldBg),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
      ],
      supportedLocales: const [
        Locale('fa'), // farsi
      ],
      theme: ThemeData(
        //input Border
        inputDecorationTheme: InputDecorationTheme(
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          activeIndicatorBorder:
              const BorderSide(color: SolidColors.primeryColor),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: SolidColors.primeryColor),
            borderRadius: BorderRadius.circular(15),
          ),
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: SolidColors.borderColor),
            borderRadius: BorderRadius.circular(15),
          ),
          contentPadding: const EdgeInsets.only(top: 10),
          hintStyle: textTheme.bodyLarge!.apply(color: SolidColors.hintColor),
        ),
        //Elevated Button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              textStyle: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return textTheme.bodyLarge;
                }
                return textTheme.titleMedium;
              }),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10))),
              minimumSize: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.pressed)) {
                  return const Size(175, 60);
                }
                return const Size(170, 55);
              }),
              backgroundColor:
                  MaterialStateProperty.all(SolidColors.primeryColor)),
        ),
        // AppBar Theme
        appBarTheme: const AppBarTheme(
            backgroundColor: SolidColors.scaffoldBg,
            foregroundColor: Colors.black),
        scaffoldBackgroundColor: SolidColors.scaffoldBg,
        textTheme: const TextTheme(
          bodyMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 12,
              fontWeight: FontWeight.w300,
              color: SolidColors.posterSubTitle),
          bodyLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: SolidColors.posterTitle),
          titleMedium: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: Colors.white),
          titleLarge: TextStyle(
              fontFamily: FontFamily.dana,
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: Color(0xff286BB8)),
        ),
      ),
      home: const SplashScreen(),
    );
  }
}
