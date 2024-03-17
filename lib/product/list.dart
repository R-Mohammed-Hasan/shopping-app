import 'package:flutter/material.dart';
import 'package:shop_app_flutter/data/global_vars.dart';
import 'package:shop_app_flutter/product/product_card.dart';
import 'package:shop_app_flutter/product/product_detail.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filterOptions = const ['All', 'Addidas', 'Nike', 'Bata'];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filterOptions[0];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    const border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromRGBO(225, 225, 225, 1),
      ),
      borderRadius: BorderRadius.horizontal(
        left: Radius.circular(50),
      ),
    );

    return SafeArea(
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Shoes \n Collection',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              const Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search',
                    border: border,
                    focusedBorder: border,
                    enabledBorder: border,
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 120,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filterOptions.length,
                itemBuilder: (cxt, idx) {
                  String filter = filterOptions[idx];
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                    ),
                    child: MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () {
                          // print('Filter option: ${filter}');
                          setState(() {
                            selectedFilter = filter;
                          });
                        },
                        child: Chip(
                            backgroundColor: selectedFilter == filter
                                ? Theme.of(context).colorScheme.primary
                                : const Color.fromARGB(255, 245, 245, 253),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 245, 245, 253),
                            ),
                            label: Text(
                              filterOptions[idx],
                            ),
                            labelStyle: const TextStyle(
                              fontSize: 16,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 15,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ),
                  );
                }),
          ),
          Expanded(child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 1080) {
                return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1.7),
                    itemCount: products.length,
                    itemBuilder: (context, idx) {
                      final product = products[idx];
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) {
                              return ProductDetail(product: product);
                            }),
                          );
                        },
                        child: ProductCard(
                          title: product['title'] as String,
                          price: product['price'] as int,
                          imageUrl: product['imageUrl'] as String,
                          backgroundColor: idx.isEven
                              ? const Color.fromARGB(255, 208, 234, 254)
                              : const Color.fromARGB(255, 245, 245, 253),
                        ),
                      );
                    });
              }
              return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, idx) {
                    final product = products[idx];
                    return GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return ProductDetail(product: product);
                          }),
                        );
                      },
                      child: ProductCard(
                        title: product['title'] as String,
                        price: product['price'] as int,
                        imageUrl: product['imageUrl'] as String,
                        backgroundColor: idx.isEven
                            ? const Color.fromARGB(255, 208, 234, 254)
                            : const Color.fromARGB(255, 245, 245, 253),
                      ),
                    );
                  });
            },
          ))
        ],
      ),
    );
  }
}
