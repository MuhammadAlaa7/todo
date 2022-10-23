import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../db/db_helper.dart';
import '../models/task.dart';

class TaskController extends GetxController
{

  final List tasksList = <Task>[
    Task(
      title: 'Title 1 ',
      startTime: '7:10',
      endTime: '8:10',
      isCompleted: 0,
      color: 0,
      note: 'note something here please',
        date: 'asd'
    ),
    Task(
        title: 'Title 2 ',
        startTime: '9:10',
        endTime: '11:10',
        isCompleted: 1,
        color: 2,
        note: 'note something here please please please please please people there are alot of people note something here please please please please please people there are alot of people' ,

    ),
    Task(
        title: 'Title 3 ',
        startTime: '4:10',
        endTime: '7:10',
        isCompleted: 0,
        color: 1,
        note: 'note something here please to describe this task ',

    ),
  ];

  // void changeReminderValue( value){
  //   selectedReminder = value;
  //  update();
  //  print(selectedReminder);
  //}

addTask( { required Task  task } ){

  DBHelper.insert(task).then((value) {
    Get.back();
    Get.snackbar('success $value', '', backgroundColor: Colors.green, colorText: Colors.white,);
  }).catchError((e){
    Get.back();
    Get.snackbar('failed', '', backgroundColor: Colors.red, colorText: Colors.white,);

  });
}


}
