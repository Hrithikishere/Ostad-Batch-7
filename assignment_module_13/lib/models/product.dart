class Product {
  int id = 0;
  String name = '';
  String color = '';
  String size = '';
  int price = 0;
  String imageAddress = '';
  int quantity = 1;

  Product({
    required this.id,
    required this.name,
    required this.color,
    required this.size,
    required this.price,
    required this.imageAddress,
    required this.quantity,
  });
}

List<Product> products = [
  Product(
    id: 1,
    name: 'Pullover',
    color: 'Black',
    size: 'L',
    price: 51,
    imageAddress:
        'https://chriscross.in/cdn/shop/files/ChrisCrossPlainBlackcottonT-Shirt_800x.jpg?v=1695634950',
    quantity: 1,
  ),
  Product(
    id: 2,
    name: 'T-Shirt',
    color: 'Gray',
    size: 'L',
    price: 30,
    imageAddress:
        'https://i5.walmartimages.com/asr/23078ac4-34c3-4434-90dc-a6c2c14c2a8e.8e4993ee05195459c66175f481e5bb71.jpeg?odnHeight=768&odnWidth=768&odnBg=FFFFFF',
    quantity: 1,
  ),
  Product(
    id: 3,
    name: 'Sport Dress',
    color: 'Black',
    size: 'M',
    price: 43,
    imageAddress:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuS4xJyoK0dEiEb7bIeb2cczI01l0ul6bebA3bEQxAH31T-ngmYas1DOiESOdLseWfc1I&usqp=CAU',
    quantity: 1,
  ),
];
