//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // on click of sign in
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }

  // on click of use mobile number 
  /*void goToPhone(){
    Navigator.push(
      context, 
      MaterialPageRoute(builder: (context) => const loginPhone()),
    );
  }*/

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 18, 24, 33),
        
        //backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Column(children: [
                SizedBox(height: 80),
            
                // logo
                /*Image.asset(
                  'lib/images/logo_pages.png',
                  height: 90,
                ),
                SizedBox(height: 90),*/
            
                // email textfield
            
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      style: TextStyle(
                          color: Color.fromARGB(212, 255, 255, 255), fontSize: 20),
                      controller: emailController,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        hintText: "email",
                        prefixIcon: Icon(
                          Icons.mail_rounded,
                          color: Color.fromARGB(255, 166, 166, 166),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 45, 45, 45),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        fillColor: Color.fromARGB(255, 45, 45, 45),
                        filled: true,
                        focusColor: Color.fromARGB(255, 192, 192, 192),
                      ),
                    ),
                  ),
                ),
            
                // password textfield
            
                SizedBox(height: 15),
                SizedBox(
                  height: 55,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25.0),
                    child: TextField(
                      style: TextStyle(
                          color: Color.fromARGB(212, 255, 255, 255), fontSize: 20),
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 18),
                        hintText: "password",
                        prefixIcon: Icon(
                          Icons.lock_rounded,
                          color: Color.fromARGB(255, 166, 166, 166),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Color.fromARGB(255, 45, 45, 45),
                          ),
                          //borderSide: BorderSide(color: Colors.white),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        fillColor: Color.fromARGB(255, 45, 45, 45),
                        filled: true,
                      ),
                      inputFormatters: [LengthLimitingTextInputFormatter(16)],
                    ),
                  ),
                ),
            
                const SizedBox(
                  height: 20,
                ),
                // sign in button
                GestureDetector(
                  onTap: signIn,
                  
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 227, 201, 116),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
            
                const SizedBox(height: 35),
                // or
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Row(
                    children: const [
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Or",
                          style:
                              TextStyle(color: Color.fromARGB(255, 158, 158, 158)),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 0.5,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40),
            
                // use phone number button
                GestureDetector(
                  //onTap: goToPhone,
                  child: Container(
                    height: 55,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(horizontal: 25),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 122, 233, 165),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Center(
                      child: Text(
                        "Use mobile number",
                        style: TextStyle(
                          color: Color.fromARGB(210, 5, 4, 4),
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
            
                const SizedBox(height: 110),
                //not a member? register now
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:  [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                          color: Color.fromARGB(255, 158, 158, 158), fontSize: 15),
                    ),
                    SizedBox(width: 5),
                    TextButton(
                      onPressed: (){
                        /*Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const signUp()),
                        );*/
                      },
                      child: Text(
                        "Sign up now",
                        style: TextStyle(
                            color: Color.fromARGB(255, 35, 252, 46),
                             fontSize: 15),
                      ),
                    ),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}