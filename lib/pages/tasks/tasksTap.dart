import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:to_do/provider/list%20provider.dart';
import 'package:to_do/themes.dart';

import 'Task.dart';

class Tasks extends StatefulWidget {
  late ListProvider listProvider;

  Tasks({super.key});
  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  @override
  late ListProvider listProvider;
  @override
  Widget build(BuildContext context) {
    listProvider = Provider.of<ListProvider>(context);

    listProvider.getTaskFromFireStore();

    return Column(
      children: [
        const SizedBox(
          height: 12,
        ),
        CalendarTimeline(
          initialDate: listProvider.selectedDate,
          firstDate: DateTime.now().subtract(const Duration(days: 365)),
          lastDate: DateTime.now().add(const Duration(days: 365)),
          onDateSelected: (date) {
            listProvider.changeSelectedDate(date);
            setState(() {});
          },
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Colors.white,
          activeBackgroundDayColor: MyThemeData.primaryBlue,
          dotsColor: Colors.white,
          selectableDayPredicate: (date) => true,
          locale: 'en_ISO',
        ),
        const SizedBox(
          height: 10,
        ),
        listProvider.taskList.isEmpty
            ? Expanded(
              child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    Text(
                      "No Tasks For today.",
                      style: TextStyle(fontSize: 22),
                    ),
                    SvgPicture.asset(
                      "assets/images/A whole year-bro.svg",
                      //height: screenHeight/3,
                      semanticsLabel: 'My SVG Image',
                    ),
                  ],
                ),
            )
            : Expanded(
                child: ListView.builder(
                  itemCount: listProvider.taskList.length,
                  itemBuilder: (context, index) {
                    return taskWidget(
                      task: listProvider.taskList[index],
                    );
                  },
                ),
              )
      ],
    );
  }
}
