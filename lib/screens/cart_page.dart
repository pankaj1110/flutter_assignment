import 'package:flutter/material.dart';
import 'package:flutter_assignment/model/image_model.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<DogImage> cart = Get.arguments;
    final double total = cart.fold(0, (prev, dog) => prev + dog.price);
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(cart[index].imageUrl),
            ),
            title: Text('Dog Image $index'),
            subtitle: Text('Price: \$${cart[index].price.toStringAsFixed(2)}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Center(
            child: Text(
              'Total: \$${total.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ),
    );
  }
}
