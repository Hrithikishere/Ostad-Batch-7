import 'package:exam_week_3_assignment/api/apiSettings.dart';
import 'package:exam_week_3_assignment/model/product.dart';
import 'package:exam_week_3_assignment/utility/widgets/productItem.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    ApiSettings.isLoading = true;
    setState(() {});
    ApiSettings.getData().then((value) {
      ApiSettings.products = value;
      ApiSettings.isLoading = false;
      super.setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        actions: [
          IconButton(
            onPressed: () {
              ApiSettings.isLoading = true;
              setState(() {});
              ApiSettings.getData().then((value) {
                ApiSettings.products = value;
                ApiSettings.isLoading = false;
                setState(() {});
              });
            },
            icon: const Icon(Icons.refresh),
          )
        ],
      ),
      body: ApiSettings.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return ProductItem(
                      product: ApiSettings.products[index],
                      onDelete: () {
                        setState(() {
                          ApiSettings.isLoading = true;
                          setState(() {});
                          ApiSettings.getData().then((value) {
                            ApiSettings.products = value;
                            ApiSettings.isLoading = false;
                            setState(() {});
                          });
                        });
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 10);
                  },
                  itemCount: ApiSettings.products.length),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/addProduct');
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
