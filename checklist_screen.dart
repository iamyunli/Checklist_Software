
import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'package:path_provider/path_provider.dart';
import 'task_model.dart';
import 'widgets.dart';

class ChecklistScreen extends StatefulWidget {
  final Color backgroundColor;
  final List<Task> tasks;
  final Function(Task) onAddTask;
  final Function(int) onToggleTask;
  final Function(int) onRemoveTask;

  ChecklistScreen({
    required this.backgroundColor,
    required this.tasks,
    required this.onAddTask,
    required this.onToggleTask,
    required this.onRemoveTask,
  });

  @override
  _ChecklistScreenState createState() => _ChecklistScreenState();
}

class _ChecklistScreenState extends State<ChecklistScreen> {
  final TextEditingController _taskController = TextEditingController();
  String _savePath = '';

  @override
  void initState() {
    super.initState();
    _loadDefaultSavePath();
  }

  Future<void> _loadDefaultSavePath() async {
    final directory = await getApplicationDocumentsDirectory();
    setState(() {
      _savePath = '${directory.path}/checklist.json';
    });
  }

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      widget.onAddTask(Task(title: _taskController.text));
      _taskController.clear();
    }
  }

  Future<void> _saveTasks() async {
    try {
      final file = File(_savePath);
      final data = json.encode({
        'tasks': widget.tasks.map((task) => task.toJson()).toList(),
        'savedAt': DateTime.now().toIso8601String(),
      });
      await file.writeAsString(data);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('任务已保存到 \$_savePath'), duration: Duration(seconds: 2)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('保存失败: \$e'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                  icon: Icon(Icons.save, size: 20),
                  label: Text('保存'),
                  onPressed: _saveTasks,
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _taskController,
                    decoration: InputDecoration(
                      hintText: 'Enter a task...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTask,
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: widget.tasks.length,
              itemBuilder: (context, index) {
                return TaskListItem(
                  task: widget.tasks[index],
                  onToggle: () => widget.onToggleTask(index),
                  onRemove: () => widget.onRemoveTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
