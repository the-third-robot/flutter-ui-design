import 'package:flutter/material.dart';

import '../constants.dart';

class AllPayments extends StatefulWidget {
  const AllPayments({Key? key}) : super(key: key);

  @override
  State<AllPayments> createState() => _AllPaymentsState();
}

class _AllPaymentsState extends State<AllPayments> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffeef3f8),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: cardData.length,
                  itemBuilder: (context, index){
                    return cardBuilder(
                      cardData[index]["icon"],
                      cardData[index]["transaction_type"],
                      cardData[index]["description"],
                      cardData[index]["amount"],
                      context,
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
