class Product {
  final String id;
  final String productName;
  final String productCode;
  final String productImage;
  final double unitPrice;
  final double totalPrice;
  final int quantity;
  final DateTime createdDate;

  Product({
    required this.id,
    required this.productName,
    required this.productCode,
    required this.productImage,
    required this.unitPrice,
    required this.totalPrice,
    required this.quantity,
    required this.createdDate,
  });
}
