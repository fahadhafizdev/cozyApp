import 'package:flutter/material.dart';
import 'package:pencarian_kos/pages/favorit_page.dart';
import 'package:pencarian_kos/pages/home_page.dart';
import 'package:pencarian_kos/pages/mail_page.dart';
import 'package:pencarian_kos/pages/wallet_page.dart';
import 'package:pencarian_kos/providers/page_provider.dart';
import 'package:pencarian_kos/theme.dart';
import 'package:pencarian_kos/widgets/bottom_navbar_item.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var pageProvider = Provider.of<PageProvider>(context);

    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return MailPage();
        case 2:
          return WalletPage();
        case 3:
          return FavoritPage();

        default:
          return HomePage();
      }
    }

    Widget customNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          width: MediaQuery.of(context).size.width - 2 * edge,
          margin: EdgeInsets.symmetric(horizontal: edge, vertical: 10),
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
                index: 0,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_mail.png',
                isActive: false,
                index: 1,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_card.png',
                isActive: false,
                index: 2,
              ),
              BottomNavbarItem(
                imageUrl: 'assets/images/icon_love.png',
                isActive: false,
                index: 3,
              ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          buildContent(pageProvider.number),
          customNavigation(),
        ],
      ),
    );
  }
}
