import 'package:flutter/material.dart';
import 'package:sketch_app/screens/recent_transac.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  bool _showPassword = true;

  @override
  void initState() {
    // TODO: implement initState
    _email = TextEditingController();
    _password = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _email.dispose();
    _password.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffeef3f8),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: MediaQuery.of(context).size.height/3,
                child: Center(
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/image1.jpg'),
                    backgroundColor: Colors.red,
                    radius: 55,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 12, bottom: 3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email Address"),
                        TextFormField(
                          enableSuggestions: true,
                          autocorrect: false,
                          keyboardType: TextInputType.emailAddress,
                          controller: _email,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(Icons.email),
                          ),
                        ),
                      ],
                    ),
                  )
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    elevation: 10,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 25.0,right: 25,top: 12, bottom: 3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Password"),
                          TextFormField(
                            obscureText: _showPassword,
                            enableSuggestions: false,
                            autocorrect: false,
                            controller: _password,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    _showPassword = _showPassword? false: true;
                                  });
                                },
                                icon: _showPassword? Icon(Icons.visibility_off) :Icon(Icons.visibility) ,
                              ),
                              border: InputBorder.none,
                              icon: Icon(Icons.lock),
                            ),

                          ),
                        ],
                      ),
                    )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                    onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>RecentTransac()));
                    },
                    color: Colors.indigo.shade900,
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 140,vertical: 14),
                      child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 18)
                      ),
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              //   child: Center(
              //     child: GestureDetector(
              //       onTap: (){},
              //       child: Container(
              //         width: MediaQuery.of(context).size.width * 0.9,
              //         height: MediaQuery.of(context).size.height * 0.06,
              //         child: Center(
              //             child: Text(
              //               "Login",
              //               style: TextStyle(color: Colors.white, fontSize: 18),
              //             ),
              //         ),
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(35),
              //           color: Colors.indigo.shade900
              //         ),
              //       ),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 22),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: (){
                      },
                      child: Text("Signup"),
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: Text("Forgot Password?"),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
