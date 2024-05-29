import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_11_12/controller/product_controller.dart';
import 'package:flutter_11_12/model/product_model.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key, required this.index, required this.product});
  final int index;
  final ProductModel product;

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  final controller = ProductController();
  String? selectedSize;
  @override
  void initState() {
    log('index : ${widget.index}');
    log('message : ${controller.list[widget.index].save}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'TEN II',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.grey[900],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image
            Hero(
              tag: widget.product.id,
              child: Container(
                width: double.infinity,
                height: 700,
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Image.asset(
                  widget.product.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Category
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.product.category,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 20,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // Icons
                      IconButton(
                        onPressed: () => setState(() {
                          controller.toogle(widget.index);
                          log('message : ${controller.list[widget.index].save}');
                        }),
                        icon: Icon(
                          !widget.product.save
                              ? Icons.bookmark_border
                              : Icons.bookmark,
                          color: widget.product.save ? Colors.amber : null,
                          size: 28,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '\$ ${widget.product.price}',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 24,
                      color: Colors.grey[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  // qty
                  qtyCout(),
                  const SizedBox(height: 10),

                  // size
                  Container(
                    height: 60,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: DropdownButton(
                      value: selectedSize,
                      isExpanded: true,
                      padding: const EdgeInsets.all(8),
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 18,
                        color: Colors.grey[800],
                      ),
                      items: widget.product.size
                          .map<DropdownMenuItem<String>>(
                            (value) => DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      },
                    ),
                  ),
                  // description
                  Text(
                    widget.product.decription,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      color: Colors.grey[800],
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Row qtyCout() {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              controller.list[widget.index].qty > 0
                  ? controller.list[widget.index].qty--
                  : null;
            });
          },
          child: Container(
            width: 80,
            height: 40,
            color: Colors.grey[200],
            child: const Icon(Icons.remove),
          ),
        ),
        const SizedBox(width: 10),
        Container(
          width: 80,
          height: 40,
          color: Colors.grey[200],
          alignment: Alignment.center,
          child: Text(
            '${controller.list[widget.index].qty}',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 24,
              color: Colors.grey[800],
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              controller.list[widget.index].qty++;
            });
          },
          child: Container(
            width: 80,
            height: 40,
            color: Colors.grey[200],
            child: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }
}
