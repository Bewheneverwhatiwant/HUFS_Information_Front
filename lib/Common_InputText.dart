import 'package:flutter/material.dart';
import 'package:hufs_information/Common_paddingElement.dart';

//labelText랑 width 등등 인자 여러개 넣어서 재사용할 수 있게 만들었엉! 검토부탁!

class InputText extends StatefulWidget {
  const InputText(
      {super.key,
      // required this.onChanged,
      required this.textEditCtrl,
      this.labelText = '',
      this.labelWidth = double.infinity});

  final String labelText;
  final double labelWidth;
  final TextEditingController textEditCtrl;
  // final ValueChanged<String> onChanged;

  @override
  _InputTextState createState() => _InputTextState();
}

class _InputTextState extends State<InputText> {
  @override
  Widget build(BuildContext context) {
    return paddingLR(SizedBox(
      width: widget.labelWidth,
      child: TextField(
        controller: widget.textEditCtrl,
        // onChanged: widget.onChanged,
        decoration: InputDecoration(
          labelText: widget.labelText,
          labelStyle: const TextStyle(
            color: Colors.blue,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ));
  }
}
