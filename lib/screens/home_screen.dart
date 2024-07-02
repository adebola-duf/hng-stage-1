import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:myapp/screens/checkout_screen.dart';
import 'package:myapp/widgets/shoe_lists.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(35),
                      ),
                      color: Color.fromARGB(255, 144, 202, 249),
                    ),
                    height: MediaQuery.sizeOf(context).height * .4,
                    width: double.infinity,
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 25.0),
                        child: Image.asset(
                          'assets/images/Obasanjo-Originals.png',
                          height: 100,
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
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10),
                        child: Text(
                          '₦35000',
                          style: TextStyle(color: Colors.white),
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
                  child: const ShoeLists(),
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
                                  builder: (context) => const CheckoutScreen(),
                                ),
                              ),
                              child: Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(5.0, 20, 20, 20),
                                child: Badge(
                                  label: const Text('2'),
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
