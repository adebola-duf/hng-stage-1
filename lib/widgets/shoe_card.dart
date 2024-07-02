import 'package:flutter/material.dart';
import 'package:myapp/models/shoe.dart';
import 'package:myapp/screens/shoe_details_screen.dart';

class ShoeCard extends StatelessWidget {
  const ShoeCard({
    super.key,
    required this.shoe,
    required this.addToCart,
    required this.removeFromCart,
    required this.noOfThisShoeInCart,
  });

  final Shoe shoe;
  final void Function(Shoe shoe) addToCart;
  final void Function(Shoe shoe) removeFromCart;
  final int noOfThisShoeInCart;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ShoeDetailsScreen(
            shoe: shoe,
            addToCart: addToCart,
            removeFromCart: removeFromCart,
            noOfThisShoeInCart: noOfThisShoeInCart,
          ),
        ),
      ),
      child: SizedBox(
        width: 200,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 235,
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 30, left: 5, right: 5),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: shoe.color,
              ),
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      shoe.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      children: [
                        RichText(
                          text: TextSpan(
                            text: shoe.price[0],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 10),
                            children: <TextSpan>[
                              TextSpan(
                                text: shoe.price.substring(1),
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Container(
                          decoration: const ShapeDecoration(
                            shape: CircleBorder(),
                            color: Colors.black,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                'assets/icons/add-to-cart.png',
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: -30,
              child: Hero(
                tag: shoe.name,
                child: SizedBox(
                  height: 180,
                  width: 180,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
