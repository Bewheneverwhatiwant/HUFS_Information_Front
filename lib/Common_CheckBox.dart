import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {

  @override
  _CheckBoxState createState() => _CheckBoxState();
}

class _CheckBoxState extends State<Checkbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Checkbox(
      value: _isChecked,
      
      onChanged: (bool? value) {
        setState(() {
          _isChecked = value ?? false;
        });

      },
    );
  }
}
