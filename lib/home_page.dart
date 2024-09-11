import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:task/product_detail_screen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List products = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));
    if (response.statusCode == 200) {
      setState(() {
        products = json.decode(response.body)['products'];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Near Store'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(left: 16),
              alignment: Alignment.topLeft,
              child: Text(
                "Category List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 0.0),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5),
                      child: Material(
                        color: Colors.white70,
                        shadowColor: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          splashColor: Colors.blue.withOpacity(0.5),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return SearchView(selectedDropdownItem: title,);
                            // }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade100,
                                    child: Image.network(
                                      products[0]['thumbnail'],
                                      // color: Colors.blue,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5),
                      child: Material(
                        color: Colors.white70,
                        shadowColor: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          splashColor: Colors.blue.withOpacity(0.5),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return SearchView(selectedDropdownItem: title,);
                            // }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade100,
                                    child: Image.network(
                                      products[2]['thumbnail'],
                                      // color: Colors.blue,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5),
                      child: Material(
                        color: Colors.white70,
                        shadowColor: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          splashColor: Colors.blue.withOpacity(0.5),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return SearchView(selectedDropdownItem: title,);
                            // }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade100,
                                    child: Image.network(
                                      products[3]['thumbnail'],
                                      // color: Colors.blue,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5),
                      child: Material(
                        color: Colors.white70,
                        shadowColor: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          splashColor: Colors.blue.withOpacity(0.5),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return SearchView(selectedDropdownItem: title,);
                            // }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade100,
                                    child: Image.network(
                                      products[4]['thumbnail'],
                                      // color: Colors.blue,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 5),
                      child: Material(
                        color: Colors.white70,
                        shadowColor: Colors.blue.withOpacity(0.1),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        child: InkWell(
                          highlightColor: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          splashColor: Colors.blue.withOpacity(0.5),
                          onTap: () {
                            // Navigator.push(context, MaterialPageRoute(builder: (context) {
                            //   return SearchView(selectedDropdownItem: title,);
                            // }));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.blue.shade100,
                                    child: Image.network(
                                      products[5]['thumbnail'],
                                      // color: Colors.blue,
                                      width: 50,
                                      height: 50,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 8.0,
                                ),
                                Text(
                                  "Product",
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.blueAccent),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              alignment: Alignment.topLeft,
              child: Text(
                "Product List",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height / 1.68,
                child: isLoading
                    ? Center(child: CircularProgressIndicator())
                    : GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: products.length,
                        itemBuilder: (context, index) {
                          final product = products[index];
                          var rate = product['rating'].toString().split('.');
                          var rates = rate[0] + rate[1].characters.first;
                          print(rates.toString());
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreen(product: product),
                                ),
                              );
                            },
                            child: Stack(
                              children: [
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(15),
                                    child: Column(
                                      children: [
                                        Image.network(product['thumbnail'],
                                            height: 100, fit: BoxFit.cover),
                                        Text(product['title'],
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Container(),
                                            Container(
                                                padding: EdgeInsets.symmetric(vertical: 3,horizontal: 5),
                                                decoration: BoxDecoration(
                                                  color: Colors.yellow.shade200,
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                ),
                                                child: Text(
                                                  '\u{20B9} ${product['price']}',
                                                  style: TextStyle(
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 4,
                                  left: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomRight: Radius.circular(8))),
                                    child: Column(
                                      children: [
                                        Text(
                                          "${product['rating'].toString()}"
                                              .substring(
                                                  0,
                                                  product['rating']
                                                          .toString()
                                                          .length -
                                                      1),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        Icon(Icons.star,size: 12,color: Colors.yellow,),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ),
            ),
          ],
        ));
  }
}

class Categorylist extends StatelessWidget {
  const Categorylist({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
