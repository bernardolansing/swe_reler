import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/user_dash/coupon_dialog.dart';

class YourCoupons extends StatelessWidget {
  const YourCoupons({super.key});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text('seus cupons', style: Theme.of(context).textTheme.headlineSmall),

      const SizedBox(height: 16),

      const Wrap(
        spacing: 16,
        runSpacing: 16,
        children: [
          _Coupon(),
          _Coupon(),
          _Coupon(),
        ],
      )
    ],
  );
}

class _Coupon extends StatelessWidget {
  const _Coupon();

  @override
  Widget build(BuildContext context) => InkWell(
    onTap: () => showDialog(
        context: context,
        builder: (context) => const CouponDialog(
            code: 'XHJA89D9',
            benefit: '60% off em compras na Amazon'
        )
    ),
    child: Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: IntrinsicHeight(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('60% off', style: _benefitTextStyle),

              const VerticalDivider(width: 24, thickness: 1),

              Column(
                children: [
                  Text(
                      'compras na',
                      style: Theme.of(context).textTheme.bodyMedium
                  ),

                  const Image(
                      image: AssetImage('assets/partner-stores/amazon.png')
                  )
                ],
              )
            ],
          ),
        ),
      ),
    ),
  );

  static const _benefitTextStyle = TextStyle(
    fontFamily: 'Poppins',
    fontSize: 32,
    fontWeight: FontWeight.w600,
    color: Colors.black,
  );
}
