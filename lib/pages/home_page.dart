import 'package:flutter/material.dart';
import 'package:shop_app_flutter/pages/cart_page.dart';

import '../widgets/product_list.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int currentPage = 0;

  List<Widget> pages = const [
    ProductList(),
    CartPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentPage,
        children: pages,
      ),
      //or
      // body: currentPage == 0 ? pages[0] : pages[1],
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0, //done to get the fontsize of label to 0
        unselectedFontSize: 0, //done to get the fontsize of label to 0
        iconSize: 35,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            label: '',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
    );
  }
}
