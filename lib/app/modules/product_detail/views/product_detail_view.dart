import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/product_detail_controller.dart';

class ProductDetailView extends GetView<ProductDetailController> {
  final Map<String, dynamic> data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProductDetailView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Center(
            child: Text(
              '${data['name']}',
              style: TextStyle(fontSize: 20),
            ),
          ),
          Center(
            child: Text(
              'Rp.${data['price']}',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      
    );
  }
}
