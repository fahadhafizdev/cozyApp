import 'package:flutter/material.dart';
import 'package:pencarian_kos/providers/page_provider.dart';
import 'package:pencarian_kos/theme.dart';
import 'package:provider/provider.dart';

class BottomNavbarItem extends StatelessWidget {
  final String imageUrl;

  final int index;

  BottomNavbarItem({this.imageUrl, this.index});

  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);

    return GestureDetector(
      onTap: () {
        pageProvider.number = index;
        print(index);
      },
      child: Column(
        children: [
          Spacer(),
          Image.asset(
            imageUrl,
            width: 26,
            height: 26,
            color: (index == pageProvider.number) ? purpleColor : greyColor,
          ),
          Spacer(),
          (index == pageProvider.number)
              ? Container(
                  width: 30,
                  height: 2,
                  decoration: BoxDecoration(
                      color: purpleColor,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(1000),
                      )),
                )
              : Container()
        ],
      ),
    );
  }
}
