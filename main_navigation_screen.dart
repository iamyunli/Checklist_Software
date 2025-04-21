
import 'package:flutter/material.dart';
import 'task_model.dart';
import 'checklist_screen.dart';
import 'settings_screen.dart';
import 'widgets.dart';

class MainNavigationScreen extends StatefulWidget {
  @override
  _MainNavigationScreenState createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _selectedIndex = 0;
  Color _backgroundColor = Colors.white;
  final List<Task> _tasks = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _updateBackgroundColor(Color color) {
    setState(() {
      _backgroundColor = color;
    });
  }

  void _addTask(Task task) {
    setState(() {
      _tasks.add(task);
    });
  }

  void _toggleTask(int index) {
    setState(() {
      _tasks[index].isCompleted = !_tasks[index].isCompleted;
    });
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColor,
      drawer: AppDrawer(
        selectedIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
      appBar: AppBar(
          title: Text(_selectedIndex == 0 ? 'My Checklist' : 'Settings')),
      body: _selectedIndex == 0
          ? ChecklistScreen(
              backgroundColor: _backgroundColor,
              tasks: _tasks,
              onAddTask: _addTask,
              onToggleTask: _toggleTask,
              onRemoveTask: _removeTask,
            )
          : SettingsScreen(
              initialColor: _backgroundColor,
              onColorChanged: _updateBackgroundColor,
              onApply: () => _onItemTapped(0),
            ),
    );
  }
}
