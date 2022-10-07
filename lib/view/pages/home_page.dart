import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/view/pages/add_task_page.dart';
import 'package:todo/view/theme.dart';
import 'package:todo/view/widgets/button.dart';

import '../widgets/input_field.dart';

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
        leading: IconButton(
          onPressed: ThemeServices().switchTheme ,
          icon: const Icon(Icons.wb_sunny_sharp),
        ),
      ),
      body: Center(
        child: MyButton(label: 'Go to add task page', onTap: ()=>  Get.to( AddTaskPage()),),
      ),
    );
  }
}
