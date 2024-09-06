import 'package:flutter/material.dart';
import 'package:module_13_assignment/models/product.dart';

int totalAmount = 0;

void calculateTotalAmount() {
  totalAmount = 0;
  for (var product in products) {
    totalAmount += product.price * product.quantity;
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    calculateTotalAmount();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //app bar
              const Text(
                'My Bag',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              //products list
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    //product card
                    return Container(
                      height: 120,
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          //image and product Details
                          Row(
                            children: [
                              //image
                              SizedBox(
                                width: 100,
                                child: Image.network(
                                  products[index].imageAddress,
                                  width: 100,
                                  height: 100,
                                  cacheWidth: 100,
                                  cacheHeight: 100,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(
                                    Icons.error,
                                    color: Colors.red,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              //product details
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        products[index].name,
                                        style: const TextStyle(
                                          color: Colors.black87,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          const Text(
                                            'Color: ',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(products[index].color),
                                          const SizedBox(width: 10),
                                          const Text(
                                            'Size: ',
                                            style:
                                                TextStyle(color: Colors.grey),
                                          ),
                                          Text(products[index].size),
                                        ],
                                      ),
                                    ],
                                  ),
                                  //add and remove buttons
                                  SizedBox(
                                    width: 120,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            products[index].quantity--;
                                            calculateTotalAmount();
                                            setState(() {});
                                          },
                                          icon: const Icon(Icons.remove),
                                        ),
                                        Text(
                                          '${products[index].quantity}',
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            products[index].quantity++;
                                            calculateTotalAmount();
                                            setState(() {});
                                          },
                                          icon: const Icon(Icons.add),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          //price and more button
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              const Icon(
                                Icons.more_vert_outlined,
                                color: Colors.grey,
                              ),
                              const SizedBox(height: 25),
                              Text(
                                '${products[index].price}\$',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              //total amount and checkout button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Total amount: ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  Text(
                    '$totalAmount\$',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              //checkout button
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Congratulations!")));
                },
                child: const Text(
                  'CHECK OUT',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
