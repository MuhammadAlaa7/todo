import 'package:flutter/material.dart';
import 'package:todo/view/theme.dart';

import '../../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(this.task, {Key? key}) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 400,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor(1),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Expanded(  // expanded so that the column take the rest from the row
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Title' , style: titleStyle,),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  children:  [
                    const Icon(Icons.access_time_rounded , color: Colors.grey,),
                    const SizedBox(width: 8,),
                    Text('8:10', style: bodyText,),
                    const SizedBox(width: 8,),
                    Text('8:10', style: bodyText,),

                  ],
                ),
                Container(
              padding: const EdgeInsets.only(top: 10),
                  child:
                  const Text('note something new in you file sfadsf sadfdsaf asfdsaf asfdsaf asfd saf sadfsadfsaf as fdsa fdsa fsaf sfs'),
                ),
              ],
            ),
          ),
          const RotatedBox(
            quarterTurns: 1,
            child: Text(
              'TODO',
              style: TextStyle(
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
        return primaryClr;
    }
  }
}
