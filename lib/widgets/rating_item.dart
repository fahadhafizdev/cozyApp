import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;

  RatingItem({this.index, this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/icon_star.png',
      width: 20,
      color: index <= rating ? null : Color(0xff989BA1),
    );
  }
}
