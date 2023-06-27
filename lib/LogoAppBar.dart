import 'package:flutter/material.dart';

class LogoAppBar extends StatelessWidget implements PreferredSizeWidget{
  const LogoAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('HUFS 정보모아'),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}