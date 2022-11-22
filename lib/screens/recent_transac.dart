import 'package:flutter/material.dart';
import 'package:sketch_app/constants.dart';
import 'package:sketch_app/screens/bottom_navigation.dart';
import 'package:sketch_app/screens/home_profile.dart';

class RecentTransac extends StatefulWidget {
  const RecentTransac({Key? key}) : super(key: key);

  @override
  State<RecentTransac> createState() => _RecentTransacState();
}

class _RecentTransacState extends State<RecentTransac> {
  tiles(var title){
    return GestureDetector(
      onTap: (){},
      child: Padding(
        padding: const EdgeInsets.only(right: 5,top: 5),
        child: Container(
          height: 28,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: Colors.indigo.shade700
          ),
          child: Center(child: Text("$title", style: TextStyle(color: Colors.white),)),
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffeef3f8),
        body: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 280),
              height: MediaQuery.of(context).size.height * 0.45,
              width: double.infinity,
              decoration: const BoxDecoration(

                image: DecorationImage(image: AssetImage("assets/bg_image.jpg",),fit: BoxFit.fill),
              ),
            ),
             Expanded(
               child: Padding(
                 padding: const EdgeInsets.all(12.0),
                 child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_back_ios)),
                            IconButton(onPressed: (){}, icon: const Icon(Icons.search)),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('Recent Transactions', style: titleStyle,),
                            InkWell(child: Text("See all"),onTap: (){},),
                          ],
                        ),
                        Row(
                          children: [
                            tiles("All"),
                            tiles("Income"),
                            tiles("Expense"),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Text("Today",style: style1,),
                        ),

                      ],
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: 1,
                          itemBuilder: (context, index){
                            return cardBuilder(
                              cardData[4]["icon"],
                              cardData[4]["transaction_type"],
                              cardData[4]["description"],
                              cardData[4]["amount"],
                              context,
                            );
                          }
                      ),
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      onPressed: (){
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>const BottomNavigation()));
                      },
                      color: Colors.indigo.shade900,
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 115,vertical: 18),
                        child: Text(
                            "See Details",
                            style: TextStyle(color: Colors.white, fontSize: 18)
                        ),
                      ),
                    ),
                  ],
            ),
               ),
             ),
          ]

        ),
      ),
    );
  }
}
