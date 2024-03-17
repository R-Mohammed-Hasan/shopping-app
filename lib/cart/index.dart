import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_flutter/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context).cart;
    final cart =
        context.watch<CartProvider>().cart; // Alternate shorthand of above line
    print('cart $cart');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (context, idx) {
          final cartItem = cart[idx];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(cartItem['imageUrl'] as String),
              radius: 35,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          'Delete Product ?',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        content: const Text('Are you sure you want to delete?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'No',
                              style: TextStyle(
                                color: Colors.blue,
                              ),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // Provider.of<CartProvider>(context, listen: false)
                              //     .removeFromCart(cartItem);
                              context
                                  .read<CartProvider>()
                                  .removeFromCart(cartItem);
                              Navigator.of(context).pop();
                            },
                            child: const Text(
                              'Yes',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      );
                    });
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
            title: Text(
              cartItem['title'] as String,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            subtitle: Text(
              'Size ${cartItem['size']}',
            ),
          );
        },
      ),
    );
  }
}
