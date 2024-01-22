import 'package:flutter/material.dart';
import 'package:swe_reler/src/widgets/drawer_menu.dart';
import 'donation_summary.dart';
import 'your_coupons.dart';
import 'hello_user.dart';
import 'side_pannel/side_pannel.dart';
import 'subscription_tag.dart';
import 'your_reports.dart';

class UserDashScreen extends StatefulWidget {
  const UserDashScreen({super.key});

  @override
  State<UserDashScreen> createState() => _UserDashScreenState();
}

class _UserDashScreenState extends State<UserDashScreen> {

  @override
  Widget build(BuildContext context) => const Scaffold(
    endDrawer: DrawerMenu(),
    body: SingleChildScrollView(
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(64, 0, 38, 64),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Wrap(
                      alignment: WrapAlignment.spaceBetween,
                      crossAxisAlignment: WrapCrossAlignment.end,
                      children: [
                        HelloUser(),
                        SizedBox(width: 1),
                        SubscriptionTag(),
                        SizedBox(width: 1),
                      ],
                    ),

                    SizedBox(height: 100),

                    Wrap(
                      alignment: WrapAlignment.spaceAround,
                      spacing: 28,
                      runSpacing: 56,
                      children: [
                        YourReports(),
                        DonationSummary(),
                      ]
                    ),

                    SizedBox(height: 50),
                    YourCoupons(),
                  ],
                ),
              ),
            ),

            SidePannel()
          ],
        ),
      ),
    ),
  );
}
