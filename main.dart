
import 'package:flutter/material.dart';
import 'task_model.dart';
import 'main_navigation_screen.dart';

void main() {
  runApp(ChecklistApp());
}

class ChecklistApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Checklist',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainNavigationScreen(),
    );
  }
}
