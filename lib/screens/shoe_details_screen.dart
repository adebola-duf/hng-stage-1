import 'package:flutter/material.dart';
import 'package:myapp/models/shoe.dart';

class ShoeDetailsScreen extends StatelessWidget {
  const ShoeDetailsScreen({
    super.key,
    required this.shoe,
  });

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(leading: Container(
        decoration: BoxDecoration(
          border: Border.all(width: 2)
        ),
      ),),
      body: Placeholder(),
    );
  }
}
