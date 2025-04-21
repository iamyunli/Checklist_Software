
import 'package:flutter/material.dart';
import 'widgets.dart';

class SettingsScreen extends StatefulWidget {
  final Color initialColor;
  final Function(Color) onColorChanged;
  final VoidCallback onApply;

  SettingsScreen({
    required this.initialColor,
    required this.onColorChanged,
    required this.onApply,
  });

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Color _tempSelectedColor;

  final List<Color> _colorOptions = [
    Colors.white,
    Colors.grey,
    Colors.blue,
    Colors.green,
    Colors.red,
  ];

  @override
  void initState() {
    super.initState();
    _tempSelectedColor = widget.initialColor;
  }

  void _applySettings() {
    widget.onColorChanged(_tempSelectedColor);
    widget.onApply();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Background Color',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Wrap(
              spacing: 8.0,
              children: _colorOptions.map((color) {
                return ColorOption(
                  color: color,
                  isSelected: _tempSelectedColor == color,
                  onTap: () {
                    setState(() {
                      _tempSelectedColor = color;
                    });
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _applySettings,
        child: Icon(Icons.check),
      ),
    );
  }
}
