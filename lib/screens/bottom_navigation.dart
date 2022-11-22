import 'package:flutter/material.dart';
import 'package:sketch_app/screens/all_payments.dart';
import 'package:sketch_app/screens/drawing_screen.dart';
import 'package:sketch_app/screens/home_profile.dart';
import 'package:sketch_app/screens/login_page.dart';
import 'package:sketch_app/screens/recent_transac.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {

  int pageIndex = 0;

  final pages = [
    const HomeProfile(),
    const RecentTransac(),
    const DrawingBoard(),
    const AllPayments(),
    const HomeProfile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef3f8),
      body: pages[pageIndex],
      bottomNavigationBar: buildMyNavBar(context),
    );
  }
  Container buildMyNavBar(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Color(0xffeef3f8),
        borderRadius: const BorderRadius.only(
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 0;
              });
            },
            icon: pageIndex == 0
                ? Icon(
              Icons.home_filled,
              color: Colors.indigo.shade900,
              size: 35,
            )
                : Icon(
              Icons.home_outlined,
              color: Colors.grey.shade700,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 1;
              });
            },
            icon: pageIndex == 1
                ? Icon(
              Icons.credit_card,
              color: Colors.indigo.shade900,
              size: 35,
            )
                : Icon(
              Icons.credit_card,
              color: Colors.grey.shade700,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 2;
              });
            },
            icon: pageIndex == 2
                ? Icon(
              Icons.add_box,
              color: Colors.indigo.shade900,
              size: 35,
            )
                : Icon(
              Icons.add_box,
              color: Colors.grey.shade700,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 3;
              });
            },
            icon: pageIndex == 3
                ? Icon(
              Icons.local_atm,
              color: Colors.indigo.shade900,
              size: 35,
            )
                : Icon(
              Icons.local_atm,
              color: Colors.grey.shade700,
              size: 35,
            ),
          ),
          IconButton(
            enableFeedback: false,
            onPressed: () {
              setState(() {
                pageIndex = 4;
              });
            },
            icon: pageIndex == 4
                ? Icon(
              Icons.account_circle,
              color: Colors.indigo.shade900,
              size: 35,
            )
                : Icon(
              Icons.account_circle,
              color: Colors.grey.shade700,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}
