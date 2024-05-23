// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_11_12/category.dart';

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<Category> categorys = [
    Category(icon: Icons.monetization_on, title: "Wallet"),
    Category(icon: Icons.wallet_giftcard_rounded, title: "Delivery"),
    Category(icon: Icons.message_rounded, title: "Message"),
    Category(icon: Icons.currency_bitcoin, title: "Service"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'User Setting',
          style: TextStyle(
            fontFamily: 'Jacquard',
            fontSize: 36,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: ListView(
          children: [
            // Card
            Container(
              width: MediaQuery.of(context).size.width,
              height: 240,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(26),
                color: Colors.blue,
              ),
              child: Column(
                children: <Widget>[
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 40,
                      backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-vector/man-shows-gesture-great-idea_10045-637.jpg?t=st=1716438824~exp=1716442424~hmac=272954f8341d137021c3cd1d34bfdd09500a68aec553350c182be8612778e83e&w=740'),
                    ),
                    title: Text(
                      'Kmeng Thoch',
                      style: TextStyle(
                        fontFamily: 'Jacquard',
                        fontSize: 28,
                      ),
                    ),
                    subtitle: Text(
                      'Flutter Developer',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      categoryInContainer(title: '267', subTitle: 'Track'),
                      categoryInContainer(title: '39', subTitle: 'Coupons'),
                      categoryInContainer(title: '846', subTitle: 'Collect'),
                      categoryInContainer(title: '846', subTitle: 'Collect'),
                    ],
                  )
                ],
              ),
            ),
            // Category
            SizedBox(
              width: double.infinity,
              height: 120,
              child: ListView.builder(
                itemCount: categorys.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => categoryInListView(
                  categorys[index].icon,
                  categorys[index].title,
                ),
              ),
            ),
            // List (recommend)
            // List.generate(length, (index) => null)
          ],
        ),
      ),
    );
  }

  Column categoryInContainer({
    required String title,
    required String subTitle,
  }) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
        Text(
          subTitle,
          style: const TextStyle(
            fontFamily: 'Poppins',
            fontSize: 18,
          ),
        ),
      ],
    );
  }

  Widget categoryInListView(IconData icon, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 40),
          ),
          Text(
            title,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
