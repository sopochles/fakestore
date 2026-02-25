import 'package:flutter/material.dart';

class ProductDetailDesc extends StatelessWidget {
  final String name;
  final double price;
  final String category;
  final String description;

  const ProductDetailDesc({
    super.key,
    required this.name,
    required this.price,
    required this.category,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: TextStyle(
            color: Color(0xFF1F1449),
            fontSize: 20,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 10),
        Text(
          'Price',
          style: TextStyle(
            color: Color(0xFF999999),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 5),
        Text(
          '\$${price.toStringAsFixed(2)}',
          style: TextStyle(
            color: Color(0xFF5C40CC),
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Description',
          style: TextStyle(
            color: Color(0xFF1F1449),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Text(
          description,
          style: TextStyle(
            color: Color(0xFF1F1449),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 15),
        Text(
          'Category',
          style: TextStyle(
            color: Color(0xFF1F1449),
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 5),
        Text(
          category,
          style: TextStyle(
            color: Color(0xFF1F1449),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}
