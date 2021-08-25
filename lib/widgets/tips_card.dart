import 'package:flutter/material.dart';
import 'package:pencarian_kos/models/tips.dart';
import 'package:pencarian_kos/theme.dart';

class TipsCard extends StatelessWidget {
  final Tips tips;
  TipsCard(this.tips);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          tips.imageUrl,
          width: 80,
          height: 80,
        ),
        SizedBox(
          width: 16,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tips.title,
              style: blackTextStyle.copyWith(
                fontSize: 18,
              ),
            ),
            Text(
              'Updated ${tips.updatedAt}',
              style: lightTextStyle.copyWith(
                fontSize: 14,
              ),
            )
          ],
        ),
        Spacer(),
        IconButton(
            icon: Icon(
              Icons.chevron_right,
              color: greyColor,
            ),
            onPressed: () {})
      ],
    );
  }
}
