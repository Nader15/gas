import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gas/ui/home_page.dart';
import 'package:gas/ui/splash.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:gas/ui/my_addresses.dart';

main() async {
  // if your flutter > 1.7.8 :  ensure flutter activated
  WidgetsFlutterBinding.ensureInitialized();
  GestureBinding.instance?.resamplingEnabled = true;

  await translator.init(
    localeDefault: LocalizationDefaultType.device,
    languagesList: <String>['ar', 'en'],
    assetsDirectory: 'assets/langs/',
    apiKeyGoogle: '<Key>', // NOT YET TESTED
  );

  runApp(
    LocalizedApp(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Gas Express",
      theme: ThemeData(
        fontFamily: translator.currentLanguage == "ar" ? 'Almarai' : "SourceSansPro",
      ),
      // home: HomePage(),
      home: Splash(),
      localizationsDelegates: translator.delegates,
      // Android + iOS Delegates
      locale: translator.locale,
      // Active locale
      supportedLocales: translator.locals(), // Locals list
    );
  }
}
