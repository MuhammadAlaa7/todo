import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:todo/db/db_helper.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/shared/app_binding.dart';
import 'package:todo/view/pages/add_task_page.dart';
import 'controllers/task_controller.dart';
import 'view/pages/home_page.dart';
import 'view/pages/notification_screen.dart';
import 'view/theme.dart';

void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await DBHelper.initDB();
 SystemChrome.setPreferredOrientations(
   [
     DeviceOrientation.portraitUp,
     DeviceOrientation.portraitDown,
   ]
 );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return  GetMaterialApp(

      /// <<<<<<<<<<<<<< you must use GetMaterialApp to build the get in this app
      theme: Themes.light,  // the class themes
      darkTheme: Themes.dark,
      themeMode: ThemeServices().theme, // the getter accessed through an object not a class
      initialBinding: AppBinding() ,
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
