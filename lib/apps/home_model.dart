import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'db.dart';

class HomeModel extends ChangeNotifier {
  String? data;

  Future<Map<String, dynamic>> get_regression_model(
      String targetUrl, Map<String, dynamic> data) async {
    Map<String, dynamic> return_value = {'rule': false};
    await Db().getData(targetUrl, data).then((onValue) {
      try {
        print(
            '==============value${onValue['body']}, and  type of ${onValue.runtimeType}');
        return_value = onValue['body'];
        print('================setting return value $return_value');
      } catch (e) {
        print('==================exception on e ${e}');
      }
    });
    return return_value;
  }

  @override
  Widget build(BuildContext context) {
    return const Text("Changed from home model");
  }
}
