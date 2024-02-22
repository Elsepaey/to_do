import 'package:flutter/material.dart';

class ToggleSetting extends StatelessWidget {
  final String title;
  final bool value;
  final VoidCallback onChanged;

  ToggleSetting({required this.title, required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: Switch(
        value: value,
        onChanged: (bool value) { return onChanged(); },
      ),
    );
  }
}

