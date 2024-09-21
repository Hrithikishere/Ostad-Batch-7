import 'package:exam_week_3_assignment/api/apiSettings.dart';
import 'package:exam_week_3_assignment/model/product.dart';
import 'package:exam_week_3_assignment/style/inputStyle.dart';
import 'package:flutter/material.dart';

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void dispose() {
    _productNameController.dispose();
    _productCodeController.dispose();
    _productImageController.dispose();
    _unitPriceController.dispose();
    _quantityController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _productNameController,
                decoration: appInputStyle('Enter Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _productCodeController,
                decoration: appInputStyle('Enter Product Code'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product code';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _productImageController,
                decoration: appInputStyle('Enter Product Image Link'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product image link';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _unitPriceController,
                decoration: appInputStyle('Enter Unit Price'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter unit price';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _quantityController,
                decoration: appInputStyle('Enter Quantity'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter quantity';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    addProuct(context);
                  },
                  style: appButtonStyle(),
                  child: const Text(
                    'Add Product',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void addProuct(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      Product product = Product(
        productName: _productNameController.text,
        productCode: _productCodeController.text,
        productImage: _productImageController.text,
        unitPrice: double.parse(_unitPriceController.text),
        quantity: int.parse(_quantityController.text),
        totalPrice: double.parse(_unitPriceController.text) *
            int.parse(_quantityController.text),
        createdDate: DateTime.now(),
        id: '',
      );

      ApiSettings.addProduct(product).then((value) {
        if (value) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                  'Product added successfully!\nPlease refresh the home page to see the changes'),
            ),
          );
          clearForm();
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Product add failed'),
            ),
          );
        }
      });
    }
  }

  void clearForm() {
    _productNameController.clear();
    _productCodeController.clear();
    _productImageController.clear();
    _unitPriceController.clear();
    _quantityController.clear();
  }
}
