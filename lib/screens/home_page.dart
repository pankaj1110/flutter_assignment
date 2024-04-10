import 'package:flutter/material.dart';
import 'package:flutter_assignment/controllers/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.history),
            onPressed: () {
              Get.toNamed('/history', arguments: controller.history);
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              Get.toNamed('/cart', arguments: controller.history);
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(() => controller.dogImageUrl.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        height: 400,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        ),
                        child: Image.network(controller.dogImageUrl)),
                  )
                : CircularProgressIndicator()),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.fetchDogImage,
              child: Text('Fetch'),
            ),
          ],
        ),
      ),
    );
  }
}
