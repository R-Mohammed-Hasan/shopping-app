import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class ProductDetail extends StatefulWidget {
  final Map<String, Object> product;

  const ProductDetail({
    super.key,
    required this.product,
  });

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  String selectedSize = '';

  @override
  void initState() {
    super.initState();
    // size = product
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: Column(children: [
        Text(
          widget.product['title'] as String,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        // Here Spacer Widget is used like a flex box
        const Spacer(),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Image.asset(
            widget.product['imageUrl'] as String,
            height: 250,
          ),
        ),
        const Spacer(
          flex: 2,
        ),
        Container(
          height: 250,
          decoration:
              const BoxDecoration(color: Color.fromRGBO(241, 255, 224, 1)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
                child: Text(
                  '\$${widget.product['price']}',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      (widget.product['sizes'] as List<String>).length,
                      (idx) {
                        final size =
                            (widget.product['sizes'] as List<String>)[idx];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = size;
                              });
                            },
                            child: Chip(
                              label: Text(size),
                              backgroundColor: size == selectedSize
                                  ? Theme.of(context).colorScheme.primary
                                  : const Color.fromARGB(255, 245, 245, 253),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Here we cannot directly access the 'product' variable in this class. So Flutter provides us a variable called 'widget' which is used to access the properties of the class.
                    if (selectedSize != 0) {
                      final value = {...widget.product, 'size': selectedSize};
                      Provider.of<CartProvider>(context, listen: false)
                          .addToCart(value);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Product added successfully !'),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please select a size'),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    fixedSize: const Size(350, 50),
                  ),
                  child: const Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
