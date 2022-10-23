import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../models/task.dart';

class DBHelper {
  static Database? db;



  static Future<void> initDB() async {
    if (db != null) {
      debugPrint('the database is not null');
      return;
    } else
      {
      try
      {
        
        String path = await getDatabasesPath() + 'task.db';
        db = await openDatabase(path , version: 1 ,
            onCreate: (dataBase, version) async
            {
              await dataBase.execute(
                'CREATE TABLE task ('
                    'id INTEGER PRIMARY KEY AUTOINCREMENT, '
                    'title STRING , note STRING , date STRING , '
                     'startTime STRING , endTime STRING, '
                      'remind INTEGER , repeat STRING , '
                      'color INTEGER , isCompleted INTEGER'
                    ')',
              );
            },

        );
        print('database opened');
      }
      catch (e) {
        print(e);
      }
    }
  }

  static Future<int> insert( Task task)async
  {
    print('insert');
    return await db!.insert('task', task.toJson() );  // these are the values should be inserted
  }
/*


  //start get data from database
  getDataFromDb(dataBase) {
    dayTasks = [];
    unCompletedTasks = [];
    completedTasks = [];
    favTasks = [];
    allTasks = [];
    emit(GetDataFromDatabaseState());
    dataBase.rawQuery('SELECT * FROM tasks').then((value) {
      log('getting data done successfully');
      allTasks.addAll(value);

      value.forEach((element) {
        if (element['fav'] == 'favorite') {
          favTasks.add(element);
        }
        log(element['fav']);
        if (element['status'] == 'new') {
          unCompletedTasks.add(element);
        } else if (element['status'] == 'done') {
          completedTasks.add(element);
        }
        if(element['date'] == DateFormat('yyyy-MM-dd').format(selectedDate)){
          dayTasks.add(element);
        }
      });
      emit(GetDataFromDatabaseState());
    });
  }
//end get data from database
*/

  Future<int> delete(Task task ) async {
    print('delete');
    return await db!.delete('task', where: 'id = ?' , whereArgs: [task.id]);
   }

   update(int id) async {
    print('update');
    return await db!.rawUpdate('''
    
    UPDATE task 
    SET isCompleted = ? 
    WHERE id = ? 
    ''', [1, id]);
   }

}
