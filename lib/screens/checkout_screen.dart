import 'package:flutter/material.dart';
import 'package:myapp/data/shoes_data.dart';
import 'package:myapp/models/shoe.dart';
import 'package:myapp/widgets/cart_item_card.dart';
import 'package:myapp/widgets/pay_bottom_sheet.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({
    super.key,
    required this.cartMap,
    required this.addToCart,
    required this.removeFromCart,
    required this.clearCart,
  });

  final Map<String, int> cartMap;
  final void Function(Shoe shoe) addToCart;
  final void Function(Shoe shoe) removeFromCart;
  final void Function() clearCart;

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  double _total = 0;

  @override
  void initState() {
    widget.cartMap.forEach((key, value) {
      _total +=
          shoesList.where((shoe) => shoe.name == key).first.priceInTypeDouble *
              value;
    });
    super.initState();
  }

  void _increaseTotal(double by) {
    setState(() {
      _total += by;
    });
  }

  void _decreaseTotal(double by) {
    setState(() {
      _total -= by;
    });
  }

  void _clearCart() {
    widget.clearCart();
    setState(() {
      widget.cartMap.clear();
    });
  }

  void _removeCartItemFromCart(Shoe shoe) {
    setState(() {
      widget.cartMap.remove(shoe.name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 222, 240, 255),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              height: 50,
              width: 45,
              margin: const EdgeInsets.only(left: 12.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2),
                borderRadius: BorderRadius.circular(17),
              ),
              child: const Icon(Icons.arrow_back_ios_new_rounded),
            ),
          ),
          Expanded(
            child: widget.cartMap.isEmpty
                ? const Center(
                    child: Text(
                      'Nothing Here!!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: ListView(
                      children: [
                        for (int i = 0; i < widget.cartMap.length; i++)
                          CartItemCard(
                            increaseTotal: _increaseTotal,
                            decreaseTotal: _decreaseTotal,
                            removeCartItemFromCart: _removeCartItemFromCart,
                            shoe: shoesList
                                .where((shoe) =>
                                    shoe.name ==
                                    widget.cartMap.keys.toList()[i])
                                .first,
                            addToCart: widget.addToCart,
                            removeSingleItemFromCart: widget.removeFromCart,
                            noOfThisShoeInCart:
                                widget.cartMap.values.toList()[i],
                          ),
                      ],
                    ),
                  ),
          ),
          if (widget.cartMap.isNotEmpty) const SizedBox(height: 20),
          if (widget.cartMap.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      text: 'Total: ',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      children: <TextSpan>[
                        const TextSpan(
                          text: '₦',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TextSpan(
                          text: _total.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => showModalBottomSheet(
                        context: context,
                        backgroundColor: Colors.transparent,
                        builder: (context) => PayBottomSheet(
                          clearCart: _clearCart,
                          total: _total,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: const Text('Checkout'),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
