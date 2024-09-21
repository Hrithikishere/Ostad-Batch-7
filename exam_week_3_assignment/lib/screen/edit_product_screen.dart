import 'dart:math';

import 'package:exam_week_3_assignment/api/apiSettings.dart';
import 'package:exam_week_3_assignment/model/product.dart';
import 'package:exam_week_3_assignment/style/inputStyle.dart';
import 'package:flutter/material.dart';

class EditProductScreen extends StatefulWidget {
  final String productId;
  const EditProductScreen({required this.productId, super.key});

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  Product product = Product(
    id: '',
    productName: '',
    productCode: '',
    productImage: '',
    unitPrice: 0,
    quantity: 0,
    totalPrice: 0,
    createdDate: DateTime.now(),
  );
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productImageController = TextEditingController();
  final TextEditingController _unitPriceController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    product = ApiSettings.products
        .firstWhere((product) => product.id == widget.productId);
    _productNameController.text = product.productName;
    _productCodeController.text = product.productCode;
    _productImageController.text = product.productImage;
    _unitPriceController.text = product.unitPrice.toString();
    _quantityController.text = product.quantity.toString();
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
                decoration: appInputStyle('Product Name'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _productCodeController,
                decoration: appInputStyle('Product Code'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _productImageController,
                decoration: appInputStyle('Product Image'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _unitPriceController,
                decoration: appInputStyle('Unit Price'),
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _quantityController,
                decoration: appInputStyle('Quantity'),
              ),
              const SizedBox(height: 10),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Product product = Product(
                      id: widget.productId,
                      productName: _productNameController.text,
                      productCode: _productCodeController.text,
                      productImage: _productImageController.text,
                      unitPrice: double.parse(_unitPriceController.text),
                      quantity: int.parse(_quantityController.text),
                      totalPrice: double.parse(_unitPriceController.text) *
                          int.parse(_quantityController.text),
                      createdDate: DateTime.now(),
                    );

                    bool response = ApiSettings.updateProduct(product) as bool;
                    if (response) {
                      Navigator.pop(context);
                    }
                  },
                  style: appButtonStyle(),
                  child: const Text(
                    'Edit Product',
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
}
