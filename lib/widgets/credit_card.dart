import 'package:flutter/material.dart';

class CreditCard extends StatelessWidget {
  const CreditCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromARGB(255, 171, 202, 255),
        border: Border.all(width: 0.5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                const Text('My credit card'),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: const EdgeInsets.all(10),
                  child: const Text(
                    'VISA',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      color: Color.fromARGB(255, 0, 61, 114),
                    ),
                  ),
                )
              ],
            ),
            const Text(
              '**** **** **** 1234',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text('Odufuwa Adebola'),
                Spacer(),
                Text('02/07'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
