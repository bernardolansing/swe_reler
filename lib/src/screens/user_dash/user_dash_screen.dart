import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/user_dash/hello_user.dart';
import 'package:swe_reler/src/screens/user_dash/side_pannel/side_pannel.dart';
import 'package:swe_reler/src/screens/user_dash/subscription_tag.dart';

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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      HelloUser(),
                      SubscriptionTag(),
                    ],
                  )
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
