import 'package:flutter/material.dart';
import 'package:to_do/utils/utils.dart';
import '../../firebase utils/firebase_utils.dart';
import '../../model/task.dart';
import '../../themes.dart';

class AddTaskSheet extends StatefulWidget {
  const AddTaskSheet({super.key});

  @override
  State<AddTaskSheet> createState() => _AddTaskSheetState();
}

class _AddTaskSheetState extends State<AddTaskSheet> {
  String Title = "";

  String Description = "";

  DateTime selected = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height / 1.5,
      decoration: const BoxDecoration(
          //color: Colors.white,
          ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(
              'Add New Task',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: MyThemeData.black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 22,
            ),
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                        labelText: 'Enter your task',
                        labelStyle:
                            TextStyle(fontSize: 15, color: MyThemeData.black)),
                    onChanged: (text) {
                      Title = text;
                      setState(() {});
                    },
                    validator: (text) {
                      if (text == null || text.isEmpty) {
                        return "please enter the title";
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    scrollController: ScrollController(),
                    minLines: 3,
                    maxLines: 3,
                    decoration: InputDecoration(
                        labelText: 'Description',
                        labelStyle:
                            TextStyle(fontSize: 15, color: MyThemeData.black)),
                    onChanged: (text) {
                      Description = text;
                      setState(() {});
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
                  Text(
                    'Select Date',
                    style: TextStyle(
                        color: MyThemeData.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
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
                    height: 35,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        addTask();
                      },
                      child: const Text(
                        'Add',
                        style: TextStyle(
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
      ),
    );
  }

  void addTask() {
    if (formKey.currentState!.validate()) {
      Task task = Task(
          title: Title,
          description: Description,
          date: selected.millisecondsSinceEpoch);
      // showLoading(context, 'Loading ...');
      addTaskToFirebase(task).timeout(const Duration(milliseconds: 500),
          onTimeout: () {
        print('todo was added successfully');
        showMessage(context, 'Todo was added successfully', 'OK', (context) {
          Navigator.pop(context);
          Navigator.pop(context);
        });
      });
    }
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
    if (timeOfDay != null && timeOfDay != selectedTime) {
      setState(() {
        selectedTime = timeOfDay;
        //selected.hour=timeOfDay.hour;
      });
    }
  }
}
