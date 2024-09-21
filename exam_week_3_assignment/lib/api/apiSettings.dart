import 'dart:convert';
import 'package:exam_week_3_assignment/model/product.dart';
import 'package:http/http.dart';

class ApiSettings {
  static bool isLoading = false;
  static const String baseUrl = "http://164.68.107.70:6060/api/v1/";
  static const String readData = "ReadProduct";
  static const String deleteData = "DeleteProduct/";
  static const String createData = "CreateProduct";
  static const String updateData = "UpdateProduct/";
  static List<Product> products = [];

  static Future<bool> deleteProduct(String id) async {
    Uri uri = Uri.parse(baseUrl + deleteData + id);
    Response response = await get(uri);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<bool> addProduct(Product product) async {
    Uri uri = Uri.parse(baseUrl + createData);

    Map<String, dynamic> body = {
      "Img": product.productImage.toString(),
      "ProductCode": product.productCode.toString(),
      "ProductName": product.productName.toString(),
      "Qty": product.quantity.toString(),
      "TotalPrice": product.totalPrice.toString(),
      "UnitPrice": product.unitPrice.toString(),
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  static Future<List<Product>> getData() async {
    List<Product> products = [];
    Uri uri = Uri.parse(baseUrl + readData);
    Response response = await get(uri);
    print(response.body);

    if (response.statusCode == 200) {
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse['data']) {
        Product product = Product(
          id: item['_id'] ?? '',
          productName: item['ProductName'] ?? '',
          productCode: item['ProductCode'] ?? '',
          productImage: item['Img'] ?? '',
          unitPrice: double.tryParse(item['UnitPrice'].toString()) ?? 0.0,
          totalPrice: double.tryParse(item['TotalPrice'].toString()) ?? 0.0,
          quantity: int.tryParse(item['Qty'].toString()) ?? 0,
          createdDate: DateTime.parse(item['CreatedDate']),
        );
        products.add(product);
      }
    }
    // isLoading = false;
    return products;
  }

  static Future<bool> updateProduct(Product product) async {
    Uri uri = Uri.parse(baseUrl + updateData + product.id);
    Map<String, dynamic> body = {
      "Img": product.productImage.toString(),
      "ProductCode": product.productCode.toString(),
      "ProductName": product.productName.toString(),
      "Qty": product.quantity.toString(),
      "TotalPrice": product.totalPrice.toString(),
      "UnitPrice": product.unitPrice.toString(),
    };
    Response response = await post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(body),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
