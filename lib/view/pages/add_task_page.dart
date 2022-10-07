import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/view/widgets/button.dart';
import 'package:todo/view/widgets/input_field.dart';
import 'package:intl/intl.dart';
import '../theme.dart';

class AddTaskPage extends StatefulWidget {
  AddTaskPage({Key? key}) : super(key: key);

  @override
  State<AddTaskPage> createState() => _AddTaskPageState();
}

class _AddTaskPageState extends State<AddTaskPage> {
  final TextEditingController titleController = TextEditingController();

  final TextEditingController noteController = TextEditingController();

  final DateTime selectedDate = DateTime.now();

  final String startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString();

  final String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(hours: 1)));
  int selectedReminder = 5;
  String selectedRepeat = 'None';

  // format the now but added 1 hour on it
  List<int> reminderList = [5, 10, 15, 20, 25, 30];
 List<String> repeatList = [ 'None', 'Daily', 'Weekly' , 'monthly'];
 int selectedColor = 0;
  @override
  Widget build(BuildContext context) {
    // Get.put(TaskController());
    // final state = Get.find();
    return Scaffold(
      appBar: AppBar(),
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
                onPressed: () {},
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
                    widget: const Icon(
                      Icons.access_time_rounded,
                    ),
                  ),
                ),
                Expanded(
                  child: InputField(
                    title: 'End Time',
                    hintText: endTime,
                    widget: const Icon(
                      Icons.watch_later_outlined,
                    ),
                  ),
                ),
              ],
            ),
            InputField(
                title: 'Reminder',
                hintText: '$selectedReminder  minutes earlier',
                widget: DropdownButton(

                  underline: Container(height: 0, width:  0 ,),
                  icon: const Icon(Icons.keyboard_arrow_down, size: 30,),

                  value: selectedReminder ,
                  items: reminderList.map<DropdownMenuItem<int>>(
                        (item) => DropdownMenuItem<int>(
                          child: Text(item.toString()),
                          value: item ,
                        ),
                      ).toList(),
                  onChanged: ( newValue) {
                    setState(() {
                      selectedReminder = int.parse(newValue.toString()) ;
                    });
                  },
                ),
              ),
            InputField(
              title: 'Repeat',
              hintText: selectedRepeat ,
              widget: DropdownButton(

                underline: Container(height: 0, width:  0 ,),
                icon: const Icon(Icons.keyboard_arrow_down, size: 30,),

                value: selectedRepeat ,
                items: repeatList.map(
                      (item) => DropdownMenuItem(
                    child: Text(item),
                    value: item ,
                  ),
                ).toList(),
                onChanged: ( newValue) {
                  setState(() {
                    selectedRepeat = newValue.toString();
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0 ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Text('Color', style: titleStyle,),
                        Row(
                          children: List.generate(3, (index) =>  InkWell(
                            onTap: (){
                                 setState(() {
                                   selectedColor = index ;
                                 });

                            },
                            child:  Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: CircleAvatar(
                                maxRadius: 18,
                                child: index == selectedColor ? const Icon(Icons.done, color: Colors.white,): null,
                                backgroundColor: index == 0 ? primaryClr :
                                    index == 1 ? orangeClr : pinkClr ,
                              ),
                            ),
                          ), ),
                        ),
                    ],
                  ),
                  MyButton(label: 'Add Task ', onTap: (){}),
                ],
              ),
            ),



          ],
        ),
      ),
    );
  }
}
