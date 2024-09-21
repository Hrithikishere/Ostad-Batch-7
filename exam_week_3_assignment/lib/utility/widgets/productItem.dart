import 'package:exam_week_3_assignment/api/apiSettings.dart';
import 'package:exam_week_3_assignment/model/product.dart';
import 'package:exam_week_3_assignment/screen/edit_product_screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  Product product;
  final VoidCallback? onDelete;
  ProductItem({required this.product, required this.onDelete, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //product name and unit price
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                product.productName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
              Text(
                '\$${product.unitPrice}',
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black45),
              ),
            ],
          ),
          const SizedBox(height: 10),
          //stock status
          Row(
            children: [
              const Text(
                'In Stock: ',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(width: 5),
              Text(
                product.quantity.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 5),
          //Product code
          Row(
            children: [
              const Text(
                'Product Code: ',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(width: 5),
              Text(
                product.productCode,
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 5),
          //Created Date
          Row(
            children: [
              const Text(
                'CreatedDate: ',
                style: TextStyle(fontSize: 12, color: Colors.black45),
              ),
              const SizedBox(width: 5),
              Text(
                product.createdDate.toString(),
                style: const TextStyle(fontSize: 12, color: Colors.black87),
              ),
            ],
          ),
          const SizedBox(height: 15),
          //product total price and edit and delete button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    '\$${product.totalPrice}',
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  const Text(
                    '(Total Price)',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              //edit and delete button
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return EditProductScreen(productId: product.id);
                      }));
                    },
                    icon: const Icon(Icons.edit, size: 20),
                    label: const Text(
                      'Edit',
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  TextButton.icon(
                    onPressed: () {
                      ApiSettings.deleteProduct(product.id).then((value) {
                        if (value) {
                          // Navigator.pushAndRemoveUntil(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HomeScreen();
                          // }), (route) => false);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product Deleted Successfully'),
                            ),
                          );
                          onDelete!();
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Failed to delete product'),
                            ),
                          );
                        }
                      });
                    },
                    icon: const Icon(Icons.delete_outline_outlined,
                        color: Colors.red, size: 20),
                    label: const Text(
                      'Delete',
                      style: TextStyle(color: Colors.red, fontSize: 12),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
