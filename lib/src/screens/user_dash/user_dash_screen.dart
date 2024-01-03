import 'package:flutter/material.dart';
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
    body: SingleChildScrollView(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.fromLTRB(64, 0, 38, 64),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HelloUser(),
                      Spacer(),
                      SubscriptionTag(),
                      Spacer(),
                    ],
                  ),

                  SizedBox(height: 100),

                  Wrap(
                    children: [
                      YourReports(),
                    ]
                  ),
                ],
              ),
            ),
          ),

          SidePannel()
        ],
      ),
    ),
  );
}
