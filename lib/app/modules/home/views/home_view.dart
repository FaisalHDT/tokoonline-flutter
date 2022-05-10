import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokoonline/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: controller.getProducts(),
        builder: (context, snap) {
          if (snap.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (!snap.hasData) {
            return Center(child: Text("data kosong"));
          }
          return ListView.builder(
              itemCount: snap.data!['data'].length,
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Get.toNamed(Routes.PRODUCT_DETAIL,
                        arguments: snap.data!['data'][index]);
                  },
                  leading: Icon(Icons.shop),
                  trailing: IconButton(
                      onPressed: () {
                        controller.deleteproduct(
                            snap.data!['data'][index]['id'].toString());
                      },
                      icon: Icon(Icons.delete)),
                  title: Text("${snap.data!['data'][index]['name']}"),
                  subtitle: Text("Rp.${snap.data!['data'][index]['price']}"),
                );
              });
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed(Routes.ADD_PRODUCT);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
