import 'package:flutter/material.dart';
import 'package:todo/view/theme.dart';

import '../../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);

  final Task task; // <<<<<<<<<<<<<<<<<<<<<<<,,, use it

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor(task.color),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(  // expanded so that the column take the rest from the row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(task.title ?? "null" , style: titleStyle,),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children:  [
                    const Icon(Icons.access_time_rounded , color: Colors.grey,),
                    const SizedBox(width: 8,),
                    Text( task.startTime ?? 'null', style: bodyText,),
                    const SizedBox(width: 8,),
                    Text(task.endTime ?? 'null', style: bodyText,),

                  ],
                ),
                Container(
              padding: const EdgeInsets.only(top: 10),
                  child:
                   Text(task.note ?? 'null'),
                ),
              ],
            ),
          ),
           RotatedBox(
            quarterTurns: 1,
            child: Text(
               task.isCompleted == 0 ? 'TODO' : 'Completed',
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  backgroundColor(int? color) {
    switch (color) {
      case 0:
        return primaryClr;
      case 1:
        return orangeClr;
      case 2:
        return pinkClr;
      default:
        return Colors.red;
    }
  }
}
