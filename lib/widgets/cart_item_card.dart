import 'package:flutter/material.dart';
import 'package:myapp/models/shoe.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard({
    super.key,
    required this.shoe,
    required this.addToCart,
    required this.removeSingleItemFromCart,
    required this.noOfThisShoeInCart,
    required this.removeCartItemFromCart,
    required this.increaseTotal,
    required this.decreaseTotal,
  });

  final Shoe shoe;
  final void Function(Shoe shoe) addToCart;
  final void Function(Shoe shoe) removeSingleItemFromCart;
  final void Function(Shoe shoe) removeCartItemFromCart;
  final void Function(double by) decreaseTotal;
  final void Function(double by) increaseTotal;
  final int noOfThisShoeInCart;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: shoe.color,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(color: shoe.color),
              child: shoe.needsRotation
                  ? Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.rotationZ(
                        -3.1415926535897932 / 4,
                      ),
                      child: Image.asset(shoe.imagePath),
                    )
                  : Image.asset(shoe.imagePath),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  shoe.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                QuantityComponent(
                  increaseTotal: increaseTotal,
                  decreaseTotal: decreaseTotal,
                  shoe: shoe,
                  addToCart: addToCart,
                  removeFromCart: removeSingleItemFromCart,
                  removeCartItemFromCart: removeCartItemFromCart,
                  noOfThisShoeInCart: noOfThisShoeInCart,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class QuantityComponent extends StatefulWidget {
  const QuantityComponent({
    super.key,
    required this.shoe,
    required this.addToCart,
    required this.removeFromCart,
    required this.noOfThisShoeInCart,
    required this.removeCartItemFromCart,
    required this.increaseTotal,
    required this.decreaseTotal,
  });

  final Shoe shoe;
  final void Function(Shoe shoe) addToCart;
  final void Function(Shoe shoe) removeFromCart;
  final void Function(Shoe shoe) removeCartItemFromCart;
  final void Function(double by) decreaseTotal;
  final void Function(double by) increaseTotal;
  final int noOfThisShoeInCart;

  @override
  State<QuantityComponent> createState() => _QuantityComponentState();
}

class _QuantityComponentState extends State<QuantityComponent> {
  late int noOfThisShoeInCart;
  @override
  void initState() {
    noOfThisShoeInCart = widget.noOfThisShoeInCart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          text: TextSpan(
            text: widget.shoe.price[0],
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10),
            children: <TextSpan>[
              TextSpan(
                text: '${widget.shoe.priceInTypeDouble * noOfThisShoeInCart}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                widget.removeFromCart(widget.shoe);
                widget.decreaseTotal(widget.shoe.priceInTypeDouble);
                if (--noOfThisShoeInCart == 0) {
                  widget.removeCartItemFromCart(widget.shoe);
                }
                setState(() {});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('-'),
            ),
            const SizedBox(width: 10),
            Text(noOfThisShoeInCart.toString()),
            const SizedBox(width: 10),
            ElevatedButton(
              onPressed: () {
                widget.addToCart(widget.shoe);
                widget.increaseTotal(widget.shoe.priceInTypeDouble);
                setState(() {
                  noOfThisShoeInCart++;
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('+'),
            ),
          ],
        ),
      ],
    );
  }
}
