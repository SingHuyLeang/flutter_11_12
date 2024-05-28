import 'package:flutter/material.dart';
import 'package:flutter_11_12/controller/product_controller.dart';
import 'package:flutter_11_12/model/product_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = ProductController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        centerTitle: true,
        title: const Text(
          'TEN II',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // banner
            Container(
              width: double.infinity,
              color: Colors.yellow,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              child: Text(
                'Enjoy with 25% Off 🛒 on your 1st order only in TEN11 Mobile App and Website. Valid from today onward.',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14,
                  color: Colors.indigo[600],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'New In (30 Items)',
                textAlign: TextAlign.center,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18,
                ),
              ),
            ),
            // product
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GridView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: 400,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: controller.list.length,
                itemBuilder: (_, index) =>
                    cardProduct(index, controller.list[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardProduct(int index, ProductModel product) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: Image.asset(product.image, fit: BoxFit.cover),
          ),
          Flexible(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Price & Save
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Price
                      Text(
                        '\$ ${product.price}',
                        style: const TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      // Icons
                      IconButton(
                        onPressed: () => setState(() {
                          controller.toogle(index);
                        }),
                        icon: Icon(
                          !product.save
                              ? Icons.bookmark_border
                              : Icons.bookmark,
                          color: product.save ? Colors.amber : null,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  // Category
                  Text(
                    product.category,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
