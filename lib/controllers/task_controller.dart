import 'package:get/get.dart';

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
  ];

  // void changeReminderValue( value){
  //   selectedReminder = value;
  //  update();
  //  print(selectedReminder);
  //}
}
