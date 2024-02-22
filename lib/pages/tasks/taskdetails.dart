import 'dart:core';

import 'package:flutter/material.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/themes.dart';

class TaskOpened extends StatefulWidget {
  static String Route_Name = "taskDetails";

  const TaskOpened({super.key});

  @override
  State<TaskOpened> createState() => _TaskOpenedState();
}

class _TaskOpenedState extends State<TaskOpened> {
  var formKey = GlobalKey<FormState>();

  @override
  DateTime selected = DateTime.now();

  TimeOfDay selectedTime=TimeOfDay.now();
  bool edit=false;
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Task;


    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(args.date);
    TimeOfDay selectedTime=TimeOfDay.now();
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(vertical: 20),
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15),),
          child:
          SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  ' Task Details',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: MyThemeData.black),
                ),
                Form(

                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextFormField(


                        decoration: InputDecoration(
                          enabled: edit,

                            labelText: args.title,
                            labelStyle:
                            TextStyle(fontSize: 20, color: MyThemeData.black,)),
                        onChanged: (text) {

                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "please enter the title";
                          }
                          return null;
                        },
                      ),
                      TextFormField(
                        minLines: 5,
                        maxLines: 5,
                        decoration: InputDecoration(
                          enabled: edit,
                            labelText: args.description,
                            labelStyle:
                            TextStyle(fontSize: 20, color: MyThemeData.black)),
                        onChanged: (text) {


                        },
                        validator: (text) {
                          if (text == null || text.isEmpty) {
                            return "please enter the description";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            'Date',
                            style: TextStyle(
                                color: MyThemeData.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Text(
                            'Time',
                            style: TextStyle(
                                color: MyThemeData.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 5,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              chooseDate();
                            },
                            child: Card(
                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${selected.day}/${selected.month}/${selected.year}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              selectTime();
                            },
                            child: Card(

                              color: Colors.grey.shade300,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  "${selectedTime.hour}/${selectedTime.minute}",
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(fontWeight: FontWeight.bold),


                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                          onPressed: () {
setState(() {
  edit=true;
});
                          },
                          child: Text(edit?
                            'Save Changes':"Edit",
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ))
                    ],
                  ),
                ),
              ],
            ),
          ),),
        ),
      );

  }

  void chooseDate() async {
    var selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 365)));
    if (selectedDate != null) {
      selected = selectedDate;
      setState(() {});
    }
  }

  void selectTime() async {
    var timeOfDay = await showTimePicker(
      context: context,
      initialTime: selectedTime,
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if(timeOfDay != null && timeOfDay != selectedTime)
    {
      setState(() {
        selectedTime = timeOfDay;
        //selected.hour=timeOfDay.hour;


      });
    }
  }
}
