import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  CheckBox({required this.onChanged});

  final ValueChanged<bool?> onChanged;

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(_isChecked);
      },
    );
  }
}
