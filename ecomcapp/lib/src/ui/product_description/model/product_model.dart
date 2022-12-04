class ProductModel {
  final String title;
  final String description;
  final double price;
  final String imgSource;

  ProductModel(
      {required this.description,
      required this.imgSource,
      required this.price,
      required this.title});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
        title: json['title'],
        description: json['description'],
        price: json['price'],
        imgSource: json['imgsource']);
  }
}
