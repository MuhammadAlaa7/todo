import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todo/controllers/task_controller.dart';
import 'package:todo/services/theme_services.dart';
import 'package:todo/view/pages/add_task_page.dart';
import 'package:todo/view/theme.dart';
import 'package:todo/view/widgets/button.dart';

import '../../models/task.dart';
import '../size_config.dart';
import '../widgets/input_field.dart';
import '../widgets/task_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {

    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              ThemeServices().switchTheme();
              //TODO: HANDLE THIS FUCKING THINGGGGGGGGGGGGGGGG
            });
          },
          icon: Get.isDarkMode ?Icon(
             Icons.wb_sunny_sharp  ,
          ) : Icon(Icons.nightlight_round),
        ),
        actions: const [
          CircleAvatar(
            backgroundImage: AssetImage('images/person.jpeg'),
            radius: 23,
          ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          addTask(),
          addDate(),
          showTasks(),
        ],
      ),
    );
  }

  Container addTask() {
    return Container(
      margin: const EdgeInsets.only(
        left: 20,
        right: 10,
        top: 6,
        bottom: 6,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: subHead,
              ),
              Text(
                'Today',
                style: headlineTheme,
              )
            ],
          ),
          AnimationConfiguration.synchronized(
            duration: const Duration(milliseconds: 500),
            child: SlideAnimation(

              horizontalOffset: 300,
              child: MyButton(
                label: 'Add Task',
                onTap: () {
                 // Get.to(const AddTaskPage());
                  Navigator.push(context, MaterialPageRoute(builder: (ctx)=> const AddTaskPage()));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container addDate() {
    return Container(
      margin: const EdgeInsets.only(left: 20, top: 6),
      child: DatePicker(
        DateTime.now(),
        initialSelectedDate: DateTime.now(),
        selectionColor: primaryClr,
        // the color of the selected date box
        selectedTextColor: Colors.white,
        width: 70,
        // width of the selected box
        height: 100,
        // height of the selected box
        monthTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),

        /// the number of the day
        dateTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),

        /// the name of the day
        dayTextStyle: GoogleFonts.lato(
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        onDateChange: (newDate) {
          // New date selected
          setState(() {
            selectedDate = newDate;
          });
        },
      ),
    );
  }

  noTaskTile() {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // SizeConfig.orientation == Orientation.portrait
          //     ? const SizedBox(
          //         height: 0,
          //       )
          //     : const SizedBox(
          //         height: 6,
          //       ),
          SvgPicture.asset(
            'images/task.svg',
            height: 200,
            color: primaryClr.withOpacity(0.5),
          ),
          const SizedBox(
            height: 22,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 0),
            child: Text(
              'You don\'t have any tasks yet\n Add new tasks to make your days productive',
              style: subHead,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  showTasks() {
    return Expanded(
      child:  ListView.builder(
          itemCount: TaskController().tasksList.length,
          itemBuilder: (BuildContext context, int index) {
            var task = TaskController().tasksList[index];
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 1500),
            child: SlideAnimation(
             // verticalOffset: 500.0,
              horizontalOffset: 300,   //  >>>>>>>>>>>  how much far from the left side of the screen
              child: FadeInAnimation(
                child:  GestureDetector(
                  onTap: () {
                    showBottomSheet(context,  task);
                  },
                  child: TaskTile(
                    task ,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  showBottomSheet(BuildContext context, Task task) {
    Get.bottomSheet(
      SingleChildScrollView(
        child: Container(
          // this is the outer design for the bottom sheet
          padding: const EdgeInsets.only(top: 4),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.5,
          color: Get.isDarkMode ? darkHeaderClr : white,
          child: Column(
            // these are the items in the bottom sheet
            children: [
              Flexible(
                child: Container(
                  // the first design in the bottom sheet
                  width: 120,
                  height: 6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Get.isDarkMode ? Colors.grey[600] : Colors.grey[300],
                  ),
                ),
              ), // just a design
              const SizedBox(
                height: 20,
              ),
              task.isCompleted == 1
                  ? Container() // empty space for the completed container
                  : bottomSheetItem(
                      label: 'Task Completed',
                      onTap: () {
                        Get.back();
                      },
                      color: primaryClr,
                    ),
              bottomSheetItem(
                label: 'Delete Task',
                onTap: () {
                  Get.back();
                },
                color: primaryClr,
              ),
              Divider(
                color: Get.isDarkMode ? Colors.grey : Colors.black,
                thickness: 2,
              ),
              bottomSheetItem(
                label: 'Cancel',
                onTap: () {
                  Get.back();
                },
                color: primaryClr,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// this is the button in the bottom sheet
  bottomSheetItem({
    required String label,
    required Function() onTap,
    required Color color,
    bool isClose = false,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 4),
        width: MediaQuery.of(context).size.width * 0.9,
        // this is the padding left in the bottom sheet
        height: 65,
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isClose
                ? Get.isDarkMode
                    ? Colors.grey[600]!
                    : Colors.grey[300]!
                : color,
          ),
          borderRadius: BorderRadius.circular(20),
          color: isClose
              ? Colors.transparent
              : color, // transparent >> completely invisible
        ),
        child: Text(
          label,
          style: isClose
              ? titleStyle
              : titleStyle.copyWith(
                  color: Colors.white,
                ),
        ),
      ),
    );
  }




}
