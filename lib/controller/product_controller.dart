import 'package:flutter_11_12/model/product_model.dart';

class ProductController {
  List<ProductModel> list = [
    ProductModel(
      id: 1,
      category: 'Fitted Shirt',
      qty: 0,
      size: ['XS', 'S', 'M', 'L'],
      decription: 'Model is 163 cm tall / 45 kg weight and is wearing size XS.',
      save: false,
      price: 15.99,
      image: 'assets/images/1.jpg',
    ),
    ProductModel(
      id: 2,
      category: 'Fitted Shirt',
      qty: 0,
      size: ['XS', 'S', 'M', 'L'],
      decription: 'Model is 163 cm tall / 45 kg weight and is wearing size XS.',
      save: false,
      price: 19.99,
      image: 'assets/images/2.jpg',
    ),
    ProductModel(
      id: 3,
      category: 'Basic T-shirt',
      qty: 0,
      size: ['XS', 'S', 'M', 'L'],
      decription: 'Model is 163 cm tall / 45 kg weight and is wearing size XS.',
      save: false,
      price: 14.00,
      image: 'assets/images/3.jpg',
    ),
    ProductModel(
      id: 4,
      category: 'Wide Leg Trouser',
      qty: 0,
      size: ['XS', 'S', 'M', 'L'],
      decription: 'Model is 163 cm tall / 45 kg weight and is wearing size XS.',
      save: false,
      price: 25.59,
      image: 'assets/images/4.jpg',
    ),
    ProductModel(
      id: 5,
      category: 'Sweatpant With Contrast',
      qty: 0,
      size: ['XS', 'S', 'M', 'L'],
      decription: 'Model is 163 cm tall / 45 kg weight and is wearing size XS.',
      save: false,
      price: 25.99,
      image: 'assets/images/5.jpg',
    ),
    ProductModel(
      id: 6,
      category: 'Wide Leg Trouser',
      qty: 0,
      size: ['XS', 'S', 'M', 'L'],
      decription: 'Model is 163 cm tall / 45 kg weight and is wearing size XS.',
      save: false,
      price: 25.59,
      image: 'assets/images/6.jpg',
    ),
  ];

  void toogle(index) => list[index].save = !list[index].save;
}
