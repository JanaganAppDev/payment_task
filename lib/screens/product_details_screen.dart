import 'package:flutter/material.dart';

import 'cart_screen.dart';


class ProductDetailsScreen extends StatelessWidget {
  final dynamic product;

  ProductDetailsScreen({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(product['thumbnail']),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              product['title'],
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('\$${product['price']}'),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product['description']),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CartScreen(product: product),
                  ),
                );
              },
              child: Text('Buy Now'),
            ),
          )
        ],
      ),
    );
  }
}
