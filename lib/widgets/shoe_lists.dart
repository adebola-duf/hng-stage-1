import 'package:flutter/material.dart';
import 'package:myapp/data/shoes_data.dart';
import 'package:myapp/widgets/shoe_card.dart';

class ShoeLists extends StatelessWidget {
  const ShoeLists({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ListView(
            children: [
              for (int i = 0; i < shoesList.length ~/ 2; i++)
                ShoeCard(
                  shoe: shoesList[i],
                )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            children: [
              for (int i = shoesList.length ~/ 2; i < shoesList.length; i++)
                ShoeCard(
                  shoe: shoesList[i],
                )
            ],
          ),
        )
      ],
    );
  }
}
