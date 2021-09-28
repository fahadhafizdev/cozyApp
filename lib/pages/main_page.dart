import 'package:flutter/material.dart';
import 'package:pencarian_kos/theme.dart';
import 'package:pencarian_kos/widgets/bottom_navbar_item.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    customNavigation() {
      return Container(
        height: 65,
        width: MediaQuery.of(context).size.width - 2 * edge,
        margin: EdgeInsets.symmetric(horizontal: edge),
        decoration: BoxDecoration(
          color: Color(0xffF6F7F8),
          borderRadius: BorderRadius.all(Radius.circular(
            23,
          )),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_home.png',
              isActive: true,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_mail.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_card.png',
              isActive: false,
            ),
            BottomNavbarItem(
              imageUrl: 'assets/images/icon_love.png',
              isActive: false,
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          customNavigation(),
        ],
      ),
    );
  }
}
