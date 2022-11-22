import 'package:flutter/material.dart';

import '../constants.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({Key? key}) : super(key: key);

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color(0xffeef3f8),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                                PopupMenuButton(
                                  icon: Icon(Icons.menu),
                                  itemBuilder: (_) => <PopupMenuItem<String>>[
                                    const PopupMenuItem<String>(
                                        value: 'Doge',
                                        child: Text('Doge')),
                                    const PopupMenuItem<String>(
                                        value: 'Lion',
                                        child: Text('Lion')),
                                  ],
                                  onSelected: (index){
                                  },
                                ),
                                PopupMenuButton(
                                  itemBuilder: (_) => <PopupMenuItem<String>>[
                                    const PopupMenuItem<String>(
                                  value: 'Doge',
                                  child: Text('Doge')),
                                    const PopupMenuItem<String>(
                                  value: 'Lion',
                                  child: Text('Lion')),
                                  ],
                                  onSelected: (index){},
                                ),
                         ],
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height/4.5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Center(
                              child: CircleAvatar(
                                backgroundImage: AssetImage('assets/profile_pic.jpg'),
                                radius: 55,
                              ),
                            ),
                            Text(
                                "Hira Riaz",
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.indigo.shade900,
                                    fontSize: 24, fontWeight:
                                    FontWeight.w800,
                                ),
                            ),
                            const Text("UI/UX Designer"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('\$8900', style: style1),
                                Text('Income', )
                              ],
                            ),
                            Container(color: Colors.black45, height: 50, width: 2,),
                            Column(
                              children: [
                                Text('\$5500', style: style1),
                                Text('Expenses', )
                              ],
                            ),
                            Container(color: Colors.black45, height: 50, width: 2,),
                            Column(
                              children: [
                                Text('\$890', style: style1),
                                Text('Loan', )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text("Overview", style: TextStyle(color: Colors.indigo.shade900, fontSize: 24, fontWeight: FontWeight.w800),),
                        const Padding(
                          padding: EdgeInsets.only(left: 5.0),
                          child: Icon(Icons.notifications_none_rounded),
                        ),
                      ],
                    ),
                    Text("Sept 13, 2020", style: TextStyle(color: Colors.indigo.shade900, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),

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
                      context
                    );
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
