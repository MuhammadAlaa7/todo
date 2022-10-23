import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/view/widgets/button.dart';
import 'package:todo/view/widgets/input_field.dart';
import 'package:intl/intl.dart';
import '../../models/task.dart';
import '../theme.dart';

class AddTaskPage extends StatefulWidget {
  const AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  TaskController _taskController = Get.find();
  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  DateTime selectedDate = DateTime.now();

   String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

   String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)));
  int selectedReminder = 5;
  String selectedRepeat = 'None';

  // format the now but added 1 hour on it
  List<int> reminderList = [5, 10, 15, 20, 25, 30];
  List<String> repeatList = ['None', 'Daily', 'Weekly', 'monthly'];
  int selectedColor = 0;

  @override
  Widget build(BuildContext context) {
    //  Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add Task',
              style: headlineTheme,
            ),
            InputField(
              title: 'Title',
              hintText: 'Enter the title here ',
              controller: titleController,
            ),
            InputField(
              title: 'Note',
              hintText: 'Enter the note here ',
              controller: noteController,
            ),
            InputField(
              title: 'Date',
              hintText: DateFormat.yMd().format(selectedDate),
              // the format returns a string
              widget: IconButton(
                onPressed: () {
                  showDate();
                },
                icon: const Icon(
                  Icons.calendar_today_outlined,
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: InputField(
                    title: 'Start Time',
                    hintText: startTime,
                    widget: IconButton(
                      onPressed: () {
                        showTime(
                          isStart: true,
                        );
                      },
                      icon: const Icon(
                        Icons.access_time_rounded,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InputField(
                    title: 'End Time',
                    hintText: endTime,
                    widget: IconButton(
                      onPressed: () {
                        showTime(
                          isStart: false,
                        );
                      },
                      icon: const Icon(
                        Icons.watch_later_outlined,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            InputField(
              title: 'Reminder',
              hintText: '$selectedReminder  minutes earlier',
              widget: DropdownButton(
                dropdownColor: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
                underline: Container(
                  height: 0,
                  width: 0,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),

                value: selectedReminder,
                style: const TextStyle(
                  color: Colors.white,
                ),
                // when making it white it disappear beside the arrow icon
                items: reminderList
                    .map<DropdownMenuItem<int>>(
                      (item) => DropdownMenuItem<int>(
                        child: Text(item.toString()),
                        value: item,
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedReminder = int.parse(newValue.toString());
                  });
                },
              ),
            ),
            InputField(
              title: 'Repeat',
              hintText: selectedRepeat,
              widget: DropdownButton(
                dropdownColor: Colors.blueGrey,
                borderRadius: BorderRadius.circular(12),
                underline: Container(
                  height: 0,
                  width: 0,
                ),
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  size: 30,
                ),
                value: selectedRepeat,
                style: const TextStyle(
                  color: Colors.white,
                ),
                items: repeatList
                    .map(
                      (item) => DropdownMenuItem(
                        child: Text(item),
                        value: item,
                      ),
                    )
                    .toList(),
                onChanged: (newValue) {
                  setState(() {
                    selectedRepeat = newValue.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  colorColumn(),
                  MyButton(
                      label: 'Add Task ',
                      onTap: () {
                        validateData();
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column colorColumn() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Color',
          style: titleStyle,
        ),
        Row(
          children: List.generate(
            3,
            (index) => GestureDetector(
              onTap: () {
                setState(() {
                  selectedColor = index;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: CircleAvatar(
                  maxRadius: 18,
                  child: index == selectedColor
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                        )
                      : null,
                  backgroundColor: index == 0
                      ? primaryClr
                      : index == 1
                          ? orangeClr
                          : pinkClr,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  validateData() {
    if (titleController.text.isNotEmpty || noteController.text.isNotEmpty) {
      addTasksToDB();
    } else if (titleController.text.isEmpty || noteController.text.isEmpty) {
      Get.snackbar(
        'required',
        'All fields must be filled',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: white,
        colorText: pinkClr,
        icon: const Icon(
          Icons.warning_amber_outlined,
          color: Colors.red,
        ),
      );
    }
  }

  addTasksToDB() async {
    int value = await _taskController.addTask(
      task: Task(
        title: titleController.text,
        note: noteController.text,
        date: DateFormat.yMd().format(selectedDate),
        startTime: startTime,
        endTime: endTime,
        remind: selectedReminder,
        repeat: selectedRepeat,
        isCompleted: 1,
        color: 1,
        id: 1,
      ),
    );
    print(value); // this represents the id of the task
  }

  void showDate() async {
    DateTime? pickedDate = await showDatePicker(
      initialDatePickerMode: DatePickerMode.day,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2040),
    );

    if (pickedDate != null) setState(() => selectedDate = pickedDate);
  }

  void showTime({required bool isStart}) async {
    TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: isStart
          ? TimeOfDay.fromDateTime(DateTime.now())
          : TimeOfDay.fromDateTime(
              DateTime.now().add(
                const Duration(minutes: 30),
              ),
            ),
    );
   if(pickedTime != null )
     {
       if(isStart == true ) 
         {
           setState(() {
             startTime =  pickedTime.format(context);
           });
         }
       else
       {
         setState(() {
           endTime =  pickedTime.format(context);
         });
       }

     }
     
  }
}
