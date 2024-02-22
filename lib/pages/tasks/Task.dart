import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do/model/task.dart';
import 'package:to_do/pages/tasks/taskdetails.dart';
import 'package:to_do/provider/list%20provider.dart';
import 'package:to_do/themes.dart';


import '../../firebase utils/firebase_utils.dart';

class taskWidget extends StatefulWidget {
  Task task;
  taskWidget({super.key, required this.task});

  @override
  State<taskWidget> createState() => _taskWidgetState();
}

class _taskWidgetState extends State<taskWidget> {
  @override
  late ListProvider listProvider;

  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);
    DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(widget.task.date);

    return Container(
      margin: const EdgeInsets.all(5),
      child: Slidable(
        startActionPane: ActionPane(
          motion: const ScrollMotion(),
          children: [
            SlidableAction(

              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),

              onPressed: (context) {
                deleteTaskFromFireStore(widget.task)
                    .timeout(const Duration(milliseconds: 500), onTimeout: () {
                  listProvider.getTaskFromFireStore();
                  //alert(message: "deleted sucsessfully",ActionText: "ok",);
                });
              },
              backgroundColor: const Color(0xFFFE4A49),
              foregroundColor: Colors.white,
              icon: Icons.delete,
              label: 'Delete',
            ),
          ],
        ),
        child: Container(
          //margin: EdgeInsets.all(5),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.grey.shade300,borderRadius: BorderRadius.circular(15)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  width: 8,
                  height: 60,
                  decoration: BoxDecoration(
                    color:
                        isChecked ? MyThemeData.red : MyThemeData.primaryBlue,
                    borderRadius: BorderRadius.circular(25),
                  )),
              //SizedBox(
              //width: 20,
              //),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: () {},
                    child: InkWell(
                      onTap: (){Navigator.of(context).pushNamed(TaskOpened.Route_Name,arguments: widget.task,);},
                      child: Text(
                        widget.task.title,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              color: isChecked
                                  ? MyThemeData.red
                                  : MyThemeData.black,
                            ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(Icons.access_time),
                      Text("${dateTime.hour}:${dateTime.minute}",
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    color: isChecked
                                        ? MyThemeData.red
                                        : MyThemeData.black,
                                  ))
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                decoration: BoxDecoration(
                    color: isChecked
                        ? Colors.transparent
                        : MyThemeData.primaryBlue,
                    borderRadius: BorderRadius.circular(12)),
                child: isChecked
                    ? Text(
                        "Done",
                        style: TextStyle(
                          color: MyThemeData.red,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : InkWell(
                        onTap: () {
                          isChecked = true;
                          setState(() {});
                        },
                        child: const Icon(Icons.check)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
