import 'package:flutter/material.dart';
import 'package:shop_app_flutter/global_variables.dart';
import 'package:shop_app_flutter/pages/product_details_page.dart';
import 'product_cart.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const [
    'All',
    'Adidas',
    'Nike',
    'Bata',
    'Puma',
  ];
  late double count = 0;
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  List<Map<String, dynamic>> get filteredProducts {
    if (selectedFilter == 'All') {
      return products;
    } else {
      return products.where((product) {
        return product['company'] == selectedFilter;
      }).toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    // final size = MediaQuery.sizeOf(context);
    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),

      //OR
      //  BorderRadius.only(
      //   topLeft: Radius.circular(30),
      //   bottomLeft: Radius.circular(30),
      // ),
    );
    return SafeArea(
      //safearea is used for present the content at the visible area like leave
      //the space from the notches
      child: Column(
        children: [
          // SizedBox(height: 70),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "Shoes\nCollection",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                // expanded is used to take rest of the space present
                child: SizedBox(
                  height: 60,
                  child: TextField(
                    decoration: InputDecoration(
                      border: border,
                      //here focusedborder uses the seed color or else focused color default color is blue
                      focusedBorder: border,
                      enabledBorder: border,
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search item',
                      // hintStyle: TextStyle(fontWeight: FontWeight.normal),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
              itemCount: filters.length, // it helps add the value in future
              //without updating it.
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                // here we can use containers to make the different all widgets
                final filter = filters[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          selectedFilter = filter;
                          count;
                        },
                      );
                    },
                    child: Chip(
                      // chip is a small comapact widget
                      side: const BorderSide(
                        color: Color.fromRGBO(245, 247, 249, 1),
                      ),
                      backgroundColor: selectedFilter == filter
                          ? Theme.of(context).colorScheme.primary
                          : const Color.fromRGBO(245, 247, 249, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      label: Text(filter),
                      labelStyle: const TextStyle(
                        fontSize: 16,
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                );
              },
            ),
          ),
          // const SizedBox(
          //   height: 5,
          // ),

          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                if (constraints.maxWidth > 1080) {
                  return GridView.builder(
                    itemCount: filteredProducts.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.75,
                    ),
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundcolor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                } else {
                  return ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: filteredProducts.length,
                    itemBuilder: (context, index) {
                      final product = filteredProducts[index];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return ProductDetailsPage(product: product);
                              },
                            ),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as double,
                          image: product['imageUrl'] as String,
                          backgroundcolor: index.isEven
                              ? const Color.fromRGBO(216, 240, 253, 1)
                              : const Color.fromRGBO(245, 247, 249, 1),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
