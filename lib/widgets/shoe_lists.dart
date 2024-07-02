import 'package:flutter/material.dart';
import 'package:myapp/data/shoes_data.dart';
import 'package:myapp/models/shoe.dart';
import 'package:myapp/widgets/shoe_card.dart';

class ShoeLists extends StatelessWidget {
  const ShoeLists({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
    required this.cart,
  });

  final void Function(Shoe shoe) addToCart;
  final void Function(Shoe shoe) removeFromCart;
  final Map<String, int> cart;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 35),
              for (int i = 0; i < shoesList.length ~/ 2; i++)
                if (shoesList[i].shouldShowInList)
                  ShoeCard(
                    shoe: shoesList[i],
                    addToCart: addToCart,
                    removeFromCart: removeFromCart,
                    noOfThisShoeInCart: cart[shoesList[i].name] ?? 0,
                  ),
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              const SizedBox(height: 35),
              for (int i = shoesList.length ~/ 2; i < shoesList.length; i++)
                if (shoesList[i].shouldShowInList)
                  ShoeCard(
                    shoe: shoesList[i],
                    addToCart: addToCart,
                    removeFromCart: removeFromCart,
                    noOfThisShoeInCart: cart[shoesList[i].name] ?? 0,
                  ),
            ],
          ),
        )
      ],
    );
  }
}
