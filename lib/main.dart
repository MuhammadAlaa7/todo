import 'package:flutter/material.dart';
import 'package:todo/services/theme_services.dart';

import 'view/pages/home_page.dart';
import 'view/pages/notification_screen.dart';
import 'view/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: Themes.light,  // the class themes
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme,   // the getter accessed through an object not a class

      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
