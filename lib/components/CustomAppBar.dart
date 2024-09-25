import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final title;

  @override
  Size get preferredSize => const Size.fromHeight(50);


  const CustomAppBar({super.key, this.title});


  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.greenAccent[400],
      title: Text('${this.title}', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),),
      centerTitle: true,
    );
  }
}
