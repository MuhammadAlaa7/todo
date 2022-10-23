import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => TaskController());


  }

}