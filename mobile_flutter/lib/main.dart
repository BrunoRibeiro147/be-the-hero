import 'package:be_the_hero/pages/SplashScreen.dart';
import 'package:be_the_hero/utils/ThemeChanger.dart';
import 'package:be_the_hero/utils/Themes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ThemeChanger>(
      create: (_) => ThemeChanger(Themes().light()),
      child: MaterialAppWithTheme(),
    );
  }
}

class MaterialAppWithTheme extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeChanger>(context);

    return MaterialApp(
      home: SplashScreen(),
      theme: theme.getTheme(),
      debugShowCheckedModeBanner: false,
    );
  }
}
