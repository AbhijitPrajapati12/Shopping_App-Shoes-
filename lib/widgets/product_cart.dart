import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final double price;
  final String image;
  final Color backgroundcolor;
  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.backgroundcolor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: const Color.fromRGBO(216, 240, 253, 1), we can't do this bcuz
      //we can't use color outside if we are implementing box decoration

      decoration: BoxDecoration(
        color: backgroundcolor,
        borderRadius: BorderRadius.circular(25),
      ),
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleMedium),

          const SizedBox(height: 5),
          Text("\$ $price", style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 5),
          Center(
            child: Image.asset(
              image,
              height: 175,
            ),
          ),

          //OR
          // Image(
          //   image: AssetImage(image),
          //   height: 175,
          // )
        ],
      ),
    );
  }
}
