import 'package:flutter/material.dart';

class SubscriptionTag extends StatelessWidget {
  const SubscriptionTag({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: 360,
    width: 230,
    decoration: BoxDecoration(
      color: Theme.of(context).colorScheme.secondary,
      borderRadius: const BorderRadius.vertical(
          top: Radius.zero,
          bottom: Radius.circular(16)
      )
    ),
    child: const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'seu plano',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xFFD6CAA7)
            ),
          ),

          SizedBox(height: 16),

          Text(
            'premium',
            style: TextStyle(
                fontFamily: 'Poppins',
                fontSize: 32,
                fontWeight: FontWeight.w600,
                color: Colors.white
            ),
          )
        ],
      )
    ),
  );
}
