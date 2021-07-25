import 'package:eglimpia/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:eglimpia/pages/create_event.dart';
import 'package:eglimpia/pages/main_page.dart';
import 'package:eglimpia/pages/login_page.dart';
import 'package:eglimpia/pages/signup_page.dart';

void main() {
  runApp(MyApp());
  configLoading();
}

void configLoading() {
  EasyLoading.instance
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.custom
    ..indicatorColor = ColorsTheme.primary
    ..backgroundColor = Colors.white
    ..textColor = Colors.black
    ..progressColor = ColorsTheme.primary
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..dismissOnTap = false
    ..maskColor = Colors.grey.withOpacity(0.5);
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [
        const Locale('en'),
        const Locale('es'),
      ],
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        fontFamily: 'Roboto',
      ),
      initialRoute: '/signup',
      builder: EasyLoading.init(),
      routes: {
        '/signup': (context) => SignupPage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => MainPage(),
        '/createEvent': (context) => CreateEvent(),
      },
    );
  }
}
