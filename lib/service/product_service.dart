import 'dart:convert';
import 'package:http/http.dart' as http;

class ProductService {
  static const String baseUrl = 'https://dummyjson.com/products';

  Future<List<dynamic>> fetchProducts() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      return jsonResponse['products'];
    } else {
      throw Exception('Failed to load products');
    }
  }
}
