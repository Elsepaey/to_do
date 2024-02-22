import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do/pages/HomeScreen.dart';
import 'package:to_do/pages/splash_screen.dart';
import 'package:to_do/pages/tasks/taskdetails.dart';
import 'package:to_do/provider/list%20provider.dart';
import 'package:to_do/themes.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FirebaseFirestore.instance.disableNetwork();
  runApp(ChangeNotifierProvider(
      create: (context) => ListProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      routes: {
        Home_Page.Route_Name: (context) => const Home_Page(),
        TaskOpened.Route_Name: (context) => const TaskOpened(),
      },
      home: Splash(),
      theme: MyThemeData.light,
      debugShowCheckedModeBanner: false,
    );
  }
}
