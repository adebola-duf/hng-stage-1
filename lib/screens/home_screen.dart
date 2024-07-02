import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/models/shoe.dart';
import 'package:myapp/screens/checkout_screen.dart';
import 'package:myapp/screens/shoe_details_screen.dart';
import 'package:myapp/widgets/shoe_lists.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Map<String, int> _cart = {};

  void _addItemToCart(Shoe shoe) {
    if (_cart.containsKey(shoe.name)) {
      _cart[shoe.name] = _cart[shoe.name]! + 1;
    } else {
      _cart[shoe.name] = 1;
    }
    setState(() {});
  }

  void _removeItemFromCart(Shoe shoe) {
    if (_cart.containsKey(shoe.name)) {
      if (_cart[shoe.name]! > 1) {
        _cart[shoe.name] = _cart[shoe.name]! - 1;
      } else {
        _cart.remove(shoe.name);
      }
    }
    setState(() {});
  }

  void _emptyCart() {
    setState(() {
      _cart.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: constant_identifier_names
    const Shoe OBJShoe = Shoe(
      shouldShowInList: false,
      imageFileNAme: 'Obasanjo-Originals.png',
      color: Color.fromARGB(255, 144, 202, 249),
      priceInTypeDouble: 21000,
      description:
          'Experience the fusion of tradition and modernity with the Obasanjo Originals. These shoes offer unparalleled comfort and style, perfect for the versatile individual who values heritage and innovation.',
    );
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ShoeDetailsScreen(
                      addToCart: _addItemToCart,
                      removeFromCart: _removeItemFromCart,
                      noOfThisShoeInCart: _cart[OBJShoe.name] ?? 0,
                      shoe: OBJShoe,
                    ),
                  ),
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(35),
                        ),
                        color: OBJShoe.color,
                      ),
                      height: MediaQuery.sizeOf(context).height * .4,
                      width: double.infinity,
                      child: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Hero(
                            tag: OBJShoe.name,
                            child: Image.asset(
                              'assets/images/Obasanjo-Originals.png',
                              height: 100,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: SafeArea(
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width * .4,
                          child: const Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Find the best shoe',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'Nike Obasanjo Originals',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      left: 20,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(20)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: RichText(
                            text: TextSpan(
                              text: OBJShoe.price[0],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                  text: OBJShoe.price.substring(1),
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 30,
                      right: 20,
                      child: Container(
                        decoration: const ShapeDecoration(
                          shape: CircleBorder(),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10),
                          child: Image.asset(
                            'assets/icons/add-to-cart-white.jpg',
                            height: 24,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '\'Just Do It\' Naija Style',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(35),
                    ),
                    color: Color.fromARGB(255, 217, 238, 255),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ShoeLists(
                    addToCart: _addItemToCart,
                    removeFromCart: _removeItemFromCart,
                    cart: _cart,
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 10,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.transparent,
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  clipBehavior: Clip.hardEdge,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Padding(
                              padding: EdgeInsets.fromLTRB(20.0, 20, 5, 20),
                              child: Icon(Icons.home_outlined),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            GestureDetector(
                              onTap: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => CheckoutScreen(
                                    clearCart: _emptyCart,
                                    cartMap: _cart,
                                    addToCart: _addItemToCart,
                                    removeFromCart: _removeItemFromCart,
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5.0, 20, 20, 20),
                                child: _cart.isEmpty
                                    ? Image.asset(
                                        'assets/icons/add-to-cart.png',
                                        color: Colors.black,
                                        height: 24,
                                        width: 24,
                                      )
                                    : Badge(
                                        label: Text(
                                            '${(_cart.values.fold(0, (previousValue, element) => previousValue + element))}'),
                                        backgroundColor: Colors.black,
                                        child: Image.asset(
                                          'assets/icons/add-to-cart.png',
                                          color: Colors.black,
                                          height: 24,
                                          width: 24,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
