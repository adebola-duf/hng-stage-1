import 'package:flutter/material.dart';
import 'package:myapp/models/shoe.dart';

class ShoeDetailsScreen extends StatelessWidget {
  const ShoeDetailsScreen({
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

  Color _makeColorLighter(Color color, int amount) {
    final red = (color.red + amount).clamp(0, 255);
    final green = (color.green + amount).clamp(0, 255);
    final blue = (color.blue + amount).clamp(0, 255);

    return Color.fromARGB(255, red, green, blue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: shoe.color,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height,
              child: Center(
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Image.asset(
                    'assets/images/nike-logo.png',
                    color: _makeColorLighter(shoe.color, 20),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height,
              width: MediaQuery.sizeOf(context).width,
              child: Column(
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
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        shoe.name,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Center(
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
                  Stack(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.circular(20),
                          ),
                          color: Colors.black,
                        ),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                shoe.description,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: _makeColorLighter(shoe.color, 80),

                                  fontSize: 17,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            //       Container(
                            //         height: 50,
                            //         clipBehavior: Clip.hardEdge,
                            //         decoration: BoxDecoration(
                            //           borderRadius: BorderRadius.circular(45),
                            //         ),
                            //         margin: const EdgeInsets.only(
                            //             left: 14, right: 14, bottom: 14),
                            //         child: ListView(
                            //           scrollDirection: Axis.horizontal,
                            //           children: [
                            //             for (final size in sizes)
                            //               Center(
                            //                 child: Container(
                            //                   decoration: BoxDecoration(
                            //                     color: _makeColorLighter(
                            //                         shoe.color, 60),
                            //                     borderRadius:
                            //                         BorderRadius.circular(45),
                            //                   ),
                            //                   margin: const EdgeInsets.only(
                            //                       right: 14.0),
                            //                   child: Padding(
                            //                     padding: const EdgeInsets.symmetric(
                            //                         vertical: 8.0,
                            //                         horizontal: 25.0),
                            //                     child: Text(
                            //                       size.toString(),
                            //                     ),
                            //                   ),
                            //                 ),
                            //               ),
                            //           ],
                            //         ),
                            //       ),
                          ],
                        ),
                      ),
                      Positioned(
                        top: 0,
                        child: Container(
                          height: 20,
                          width: MediaQuery.sizeOf(context).width,
                          decoration: BoxDecoration(
                            color: shoe.color,
                            borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(20),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'PRICE',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        RichText(
                          text: TextSpan(
                            text: shoe.price[0],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: shoe.price.substring(1),
                                style: const TextStyle(
                                  fontSize: 23,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  AddToCartComponent(
                    addToCart: addToCart,
                    shoe: shoe,
                    noOfThisShoeInCart: noOfThisShoeInCart,
                    removeFromCart: removeFromCart,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddToCartComponent extends StatefulWidget {
  const AddToCartComponent({
    super.key,
    required this.addToCart,
    required this.removeFromCart,
    required this.shoe,
    required this.noOfThisShoeInCart,
  });

  final void Function(Shoe shoe) addToCart;
  final void Function(Shoe shoe) removeFromCart;
  final Shoe shoe;
  final int noOfThisShoeInCart;

  @override
  State<AddToCartComponent> createState() => _AddToCartComponentState();
}

class _AddToCartComponentState extends State<AddToCartComponent> {
  late int noOfThisShoeInCart;
  @override
  void initState() {
    noOfThisShoeInCart = widget.noOfThisShoeInCart;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(35),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Colors.black,
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(left: 25.0, top: 12, bottom: 12, right: 10),
        child: Row(
          children: [
            const Text(
              'Add to cart',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: noOfThisShoeInCart == 0
                  ? () {
                      setState(() {
                        noOfThisShoeInCart++;
                      });
                      widget.addToCart(widget.shoe);
                    }
                  : null,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                decoration: noOfThisShoeInCart == 0
                    ? ShapeDecoration(
                        shape: const CircleBorder(), color: widget.shoe.color)
                    : BoxDecoration(
                        color: widget.shoe.color,
                        borderRadius: BorderRadius.circular(10)),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 500),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: noOfThisShoeInCart == 0
                        ? Image.asset('assets/icons/add-to-cart.png')
                        : Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  widget.removeFromCart(widget.shoe);
                                  setState(() {
                                    noOfThisShoeInCart--;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: widget.shoe.color,
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
                                  setState(() {
                                    noOfThisShoeInCart++;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black,
                                  foregroundColor: widget.shoe.color,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: const Text('+'),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
