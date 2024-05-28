class ProductModel {
  int id;
  String category;
  int qty;
  List<String> size;
  String decription;
  double price;
  bool save;
  String image;

  ProductModel({
    required this.id,
    required this.category,
    required this.qty,
    required this.size,
    required this.decription,
    required this.save,
    required this.price,
    required this.image,
  });
}
