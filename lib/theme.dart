import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color purpleColor = Color(0xff5843BE);
Color orangeColor = Color(0xffFF9376);
Color whiteColor = Color(0xffFFFFFF);
Color blackColor = Color(0xff000000);
Color greyColor = Color(0xff82868E);
Color lightColor = Color(0xff7A7E86);
Color cardColor = Color(0xffF6F7F8);

double edge = 24;

TextStyle blackTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: blackColor,
);

TextStyle whiteTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: whiteColor,
);

TextStyle greyTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: greyColor,
);

TextStyle lightTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w300,
  color: lightColor,
);

TextStyle purpleTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w500,
  color: purpleColor,
);

TextStyle regulerTextStyle = GoogleFonts.poppins(
  fontWeight: FontWeight.w400,
  color: blackColor,
);

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.black87,
  primary: purpleColor,
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(17)),
  ),
);
