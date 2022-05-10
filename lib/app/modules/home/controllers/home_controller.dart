import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  final String url = "http://10.0.2.2:8000/api/products/";

  Future<Map<String, dynamic>> getProducts() async {
    var response = await http.get(Uri.parse(url));

    Map<String, dynamic> result = await json.decode(response.body);

    return result;
  }

  Future deleteproduct(String id) async {
    var response = await http.delete(Uri.parse(url + id));

    Get.snackbar("Sukses", "delete berhasil");
    update();
    return json.decode(response.body);
  }
}
