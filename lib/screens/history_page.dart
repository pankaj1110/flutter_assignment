import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/image_model.dart';
import 'package:get/get.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<DogImage> history = Get.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('History'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(history[index].imageUrl),
            ),
            title: Text('Dog Image $index'),
          );
        },
      ),
    );
  }
}
