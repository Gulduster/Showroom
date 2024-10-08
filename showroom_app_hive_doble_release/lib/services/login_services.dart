import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:showroom_maqueta/config/config.dart';
import 'package:showroom_maqueta/providers/item_provider.dart';


class LoginServices {
  int? statusCode;
  late String apiUrl = Config.APIURL;
  late String apiLink = '$apiUrl/api/auth/login';

  Future<void> login(String login, password, BuildContext context) async {
    var headers = {'Content-Type': 'application/json'};
    var data = json.encode({"login": login, "password": password});
    var dio = Dio();
    String link = apiLink;
    try {
      var response = await dio.request(
        link,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );

      statusCode = response.statusCode;

      if (statusCode == 200) {
        print(response.data['token']);
        Provider.of<ItemProvider>(context, listen: false)
            .setToken(response.data['token']);
      } else { 
        print(response.statusMessage);
      }
    } catch (e) {
      statusCode = 0;
      print('Error: $e');
    }
  }

  Future<int?> getStatusCode() async {
    return statusCode;
  }
}