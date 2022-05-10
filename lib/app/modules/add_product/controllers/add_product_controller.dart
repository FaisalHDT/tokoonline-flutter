import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class AddProductController extends GetxController {
  RxBool isLoading = false.obs;
  TextEditingController nameC = TextEditingController();
  TextEditingController deskC = TextEditingController();
  TextEditingController priceC = TextEditingController();
  TextEditingController imageC = TextEditingController();

  var url = "http://10.0.2.2:8000/api/products/";

  Future addProduct() async {
    isLoading.value = true;
    if (nameC.text.isNotEmpty &&
        deskC.text.isNotEmpty &&
        priceC.text.isNotEmpty &&
        imageC.text.isNotEmpty) {
      try {
        var response = await http.post(Uri.parse(url), body: {
          "name": nameC.text,
          "description": deskC.text,
          "price": priceC.text,
          "image_url": imageC.text
        });
        Get.back();
        Get.snackbar("Sukses", "Data berhasil ditambahkan");
        isLoading.value = false;
        return json.decode(response.body);
      } catch (e) {
        Get.snackbar("Terjadi kesalahan", "tidak apat menambahkan data");
      }
    } else {
      Get.snackbar("Terjadi Kesalahan", "Data Tidak boleh kosong");
    }
  }
}
