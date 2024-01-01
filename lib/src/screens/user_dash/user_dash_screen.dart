import 'package:flutter/material.dart';
import 'package:swe_reler/src/screens/user_dash/side_pannel/side_pannel.dart';

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
        children: [
          Spacer(),

          SidePannel()
        ],
      ),
    ),
  );
}
