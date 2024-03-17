import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final int price;
  final String imageUrl;
  final Color backgroundColor;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // We cannot declare color when we have decoration property. In that case we need to move the color inside decoration property
      // color: Color.fromRGBO(93, 93, 93, 0.098),
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color.fromRGBO(93, 93, 93, 0.098),
            blurRadius: 10,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 10),
        Text(
          '\$$price',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 10),
        Center(
          child: Image(
            image: AssetImage(imageUrl),
            height: 170,
          ),
        ),
      ]),
    );
  }
}
