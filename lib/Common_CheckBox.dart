import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  CheckBox({required this.onChanged});

  final ValueChanged<bool> onChanged; // ValueChanged<bool?> 에서 ValueChanged<bool>로 변경

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      onChanged: (bool? value) { // bool?에서 bool로 변경
        setState(() {
          _isChecked = value ?? false;
        });
        widget.onChanged(_isChecked);
      },
    );
  }
}
