import 'package:flutter/material.dart';
import 'package:todo/services/theme_services.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        leading: IconButton(
          onPressed:  ThemeServices().switchThemeMode,
          icon: const Icon(Icons.wb_sunny_sharp),
        ),
      ),
      body: Container(),
    );
  }
}
