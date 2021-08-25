import 'package:flutter/material.dart';
import 'package:pencarian_kos/pages/home_page.dart';
import 'package:pencarian_kos/theme.dart';

class ErrorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/error.png',
                width: 300,
                height: 85.95,
              ),
              SizedBox(
                height: 70.05,
              ),
              Text(
                'Where are you going ?',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were\n requested is already gone',
                textAlign: TextAlign.center,
                style: lightTextStyle.copyWith(
                  fontSize: 16,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: edge),
                height: 50,
                width: MediaQuery.of(context).size.width - (8 * edge),
                child: ElevatedButton(
                  style: raisedButtonStyle,
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomePage(),
                        ),
                        (route) => false);
                  },
                  child: Text(
                    'Back to Home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
