import 'package:flutter/material.dart';

class MenuList extends StatelessWidget {
  const MenuList({
    
    required this.text,
    this.isTitle = false,
    this.onPressed,
    this.lockAvailable = false,
  });

  
  final VoidCallback? onPressed;
  final String text;
  final bool isTitle;
  final bool lockAvailable;

  @override
  Widget build(BuildContext context) {
    return isTitle
        ? Column(
            children: <Widget>[
              ListTile(
                title: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
              Divider(),
            ],
          )
        : Row(
            children: [
              Expanded(
                child: ListTile(
                  title: Row(
                    children: [
                      Text(text),
                      if (lockAvailable) const SizedBox(width: 8.0),
                      if (lockAvailable) const Icon(Icons.lock, color: Colors.grey),
                    ],
                  ),
                  onTap: onPressed,
                ),
              ),
              const Icon(Icons.arrow_forward),
              SizedBox(width: 30),
            ],
          );
  }
}
