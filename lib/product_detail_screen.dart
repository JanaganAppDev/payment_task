import 'package:flutter/material.dart';

import 'checkout_screen.dart';

class ProductDetailScreen extends StatelessWidget {
  final Map product;

  ProductDetailScreen({required this.product});

  @override
  Widget build(BuildContext context) {
   final int rate= int.parse(product['rating'].toString().characters.first);
   print(rate);
    return Scaffold(
      appBar: AppBar(title: Text(product['title'])),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.network(product['thumbnail'])),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product['title'],
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text('\u{20B9} ${product['price']}', style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10),
                  Container(

                    width: 150,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            bottomRight: Radius.circular(8))),
                    child: Row(
                      children: [
                        Text(
                          "${product['rating'].toString()}"
                              .substring(
                              0,
                              product['rating']
                                  .toString()
                                  .length -
                                  1),
                          style: TextStyle(color: Colors.white,fontSize: 16),
                        ),

                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          height: 10,
                          width: 100,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: rate,
                            itemBuilder: (BuildContext context, int index){
                            return Icon(Icons.star,size: 17,color: Colors.yellow,);

                          },),
                        ),
                        // Icon(Icons.star,size: 12,color: Colors.yellow,),
                      ],
                    ),
                  ),
                  Text('Rating: ${product['rating']}'),
                  SizedBox(height: 20),
                  Text(product['description']),
                  SizedBox(height: 20),
               /*   ElevatedButton(
                    onPressed: () {
                      // Navigate to payment screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CheckoutScreen(product: product),
                        ),
                      );
                    },
                    child: Text('Buy Now'),
                  ),*/
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(
            color: Colors.blue,
            offset: Offset(0, 0),
            blurRadius: 0,
          ),
        ]),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                minimumSize: const Size(100, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8))),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(product: product),
                ),
              );
            },
            child: const Text("Buy Now")),
      ),
    );
  }
}
