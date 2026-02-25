import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFFFAFAFA),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios_new_rounded),
        color: Color(0xFF5C40CC),
        onPressed: () => Navigator.of(context).pop(),
      ),
    );
  }
}
