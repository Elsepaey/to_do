import 'package:flutter/material.dart';
import 'package:to_do/pages/tasks/addTask.dart';
import 'package:to_do/pages/setting/settingTap.dart';
import 'package:to_do/pages/tasks/tasksTap.dart';

class Home_Page extends StatefulWidget {
  static String Route_Name = "home";

  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text("TaskSpark",style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 10,
        child: BottomNavigationBar(
          iconSize: 20,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {});
            selectedIndex = index;
          },

          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: "Tasks",),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //showAddBottomSheet();
          showDialog(context: context, builder:(_)=>const Dialog(insetPadding: EdgeInsets.symmetric(horizontal: 20),child: AddTaskSheet(),));
        },
        shape: const StadiumBorder(side: BorderSide(color: Colors.white, width: 5)),
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: taps[selectedIndex],
    );
  }

  var taps = [Tasks(),  SettingsPage()];
  void showAddBottomSheet() {
    showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        context: context,
        builder: (context) {
          return const AddTaskSheet();
        });
  }
}
