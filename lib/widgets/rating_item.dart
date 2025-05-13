import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  const RatingItem({super.key, required this.index, required this.rating});

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.star_rounded,
      color: index <= rating ? Colors.amber : Color(0xff989BA1),
      size: 20,
    );
  }
}
