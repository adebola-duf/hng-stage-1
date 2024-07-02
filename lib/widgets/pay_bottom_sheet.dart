import 'package:flutter/material.dart';
import 'package:myapp/screens/order_success_screen.dart';
import 'package:myapp/widgets/credit_card.dart';

class PayBottomSheet extends StatefulWidget {
  const PayBottomSheet({
    super.key,
    required this.total,
    required this.clearCart,
  });

  final double total;
  final void Function() clearCart;

  @override
  State<PayBottomSheet> createState() => _PayBottomSheetState();
}

class _PayBottomSheetState extends State<PayBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 222, 240, 255),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Confirm and Pay',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const CreditCard(),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const Text('Total'),
              const Spacer(),
              RichText(
                text: TextSpan(
                  text: '₦',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 10),
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.total.toString(),
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const OrderSuccessScreen(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text('Pay Now'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
