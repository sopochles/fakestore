import 'package:flutter/material.dart';

class ProductListHeader extends StatelessWidget {
  final String name;

  const ProductListHeader({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello,",
              style: TextStyle(
                color: Color(0xFF1F1449),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              name,
              style: TextStyle(
                color: Color(0xFF1F1449),
                fontSize: 24,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 6),
            Text(
              "What to buy today?",
              style: TextStyle(
                color: Color(0xFF9698A9),
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          ],
        ),
        Container(
          height: 60,
          width: 60,
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage("assets/images/icon.jpg"),
          ),
        ),
      ],
    );
  }
}
