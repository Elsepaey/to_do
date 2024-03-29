import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../firebase utils/firebase_utils.dart';
import '../model/task.dart';

class ListProvider extends ChangeNotifier{
  List<Task> taskList = [];
  DateTime selectedDate = DateTime.now() ;


  getTaskFromFireStore() async{
    QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();

    taskList = querySnapshot.docs.map((doc) {
      return doc.data();
    }).toList();

    taskList = taskList.where((task){
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date);
      if(dateTime.year == selectedDate.year &&
          dateTime.month == selectedDate.month &&
          dateTime.day == selectedDate.day
      ){
        return true ;
      }
      return false ;

    }).toList();


    taskList.sort((Task task1 , Task task2){
      DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
      DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(task2.date);
      return dateTime1.compareTo(dateTime2);
    });
    notifyListeners() ;
  }

  changeSelectedDate(DateTime newDate){
    selectedDate = newDate ;
    notifyListeners();
  }

}