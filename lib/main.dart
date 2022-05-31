import 'package:eventfirebase/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'utils/colours.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Event App',
      home: new HomePage(),
      debugShowCheckedModeBanner: false,
      theme: _mainAppTheme(),
    );
  }

  ThemeData _mainAppTheme() {
    return ThemeData.light().copyWith(
      accentColor: AppColours.secondaryCyan,
      buttonColor: AppColours.primaryCharcoal,
      primaryColor: AppColours.primaryCharcoal,
      bottomAppBarColor: AppColours.secondaryCyanDark,
      primaryColorDark: AppColours.primaryCharcoalDark,
      primaryColorLight: AppColours.primaryCharcoalLight,
      secondaryHeaderColor: AppColours.primaryCharcoalLight,
      canvasColor: AppColours.secondaryCyanDark,
      backgroundColor: AppColours.background,
    );
  }
}
