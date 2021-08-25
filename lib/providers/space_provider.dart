import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pencarian_kos/models/space.dart';

class SpaceProvider extends ChangeNotifier {
  // getRecommendedSpaces() async {
  //   var url = Uri.parse('https://bwa-cozy.herokuapp.com/recommended-spaces');

  //   var result = await http.get(url);

  //   print(result.statusCode);
  //   print(result.body);
  // }

  getRecommendedSpaces() async {
    var url = Uri.parse('http://bwa-cozy.herokuapp.com/recommended-spaces');
    var result = await http.get(url);

    print('cek StatusCode : ${result.statusCode}');

    if (result.statusCode == 200) {
      List data = jsonDecode(result.body);
      List<Space> spaces = data.map((item) => Space.fromJson(item)).toList();
      return spaces;
    } else {
      return <Space>[];
    }
  }
}
