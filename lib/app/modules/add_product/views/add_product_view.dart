import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_product_controller.dart';

class AddProductView extends GetView<AddProductController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProductView'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextField(
            autocorrect: false,
            controller: controller.nameC,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "name"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            autocorrect: false,
            controller: controller.deskC,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "deskripsi"),
          ),
          TextField(
            keyboardType: TextInputType.number,
            autocorrect: false,
            controller: controller.priceC,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "price"),
          ),
          TextField(
            autocorrect: false,
            controller: controller.imageC,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: "image url"),
          ),
          Obx(
            () => ElevatedButton(
              onPressed: () async {
                await controller.addProduct();
              },
              child: Text(controller.isLoading.isFalse
                  ? "add prodcut"
                  : "loading . . ."),
            ),
          ),
        ],
      ),
    );
  }
}
