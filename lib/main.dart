import 'package:flutter/material.dart';
import 'package:pencarian_kos/pages/splash_page.dart';
import 'package:pencarian_kos/providers/page_provider.dart';
import 'package:pencarian_kos/providers/space_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

//hello
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SpaceProvider>(
          create: (context) => SpaceProvider(),
        ),
        ChangeNotifierProvider<PageProvider>(
          create: (context) => PageProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Cozy',
        debugShowCheckedModeBanner: false,
        home: SplashPage(),
      ),
    );
  }
}
