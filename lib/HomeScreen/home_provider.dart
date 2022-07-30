

import 'dart:convert';
import 'dart:io';

import 'package:get/get_connect/connect.dart';
import 'package:http/http.dart' as http;



class HomeProvider extends  GetConnect{



Future<dynamic> getUserList() async {
  var url = "http://www.mocky.io/v2/5d565297300000680030a986";
  final response = await http.get(Uri.parse(url),
      headers: {
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      }
  );
  if (response.statusCode != 200) {
  }
  return json.decode(response.body);
}
}
