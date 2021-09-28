import 'package:flutter/material.dart';
import 'package:pencarian_kos/pages/splash_page.dart';
import 'package:pencarian_kos/providers/space_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

//hello
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SpaceProvider(),
      child: MaterialApp(
        title: 'Cozy',
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
