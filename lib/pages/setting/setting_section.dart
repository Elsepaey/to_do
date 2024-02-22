import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class SettingSection extends StatelessWidget {
  final String title;
  final List<Widget> children;

  SettingSection({required this.title, required this.children});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: children,
        ),
      ),
    );
  }
}