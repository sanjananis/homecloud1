import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:homecloud1/pages/home_page.dart'; 
import 'package:homecloud1/pages/loginpage.dart';
import 'package:google_sign_in/google_sign_in.dart';


dynamic conn;

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<signUp> {
  // text controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();

 
  
  // on click of sign up
  Future signIn() async {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    
    
    addUserDetails(
      nameController.text.trim(), 
      emailController.text.trim(), 
      phoneController.text.trim()
      );

      
  }

  Future addUserDetails(String fullName, String emailId, String phoneNumber) async {
    await FirebaseFirestore.instance.collection('users').add({
      'full name': fullName,
      'email': emailId,
      'phone number': phoneNumber,
    });
    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()),
    );
  
  }

  // on click of sign in with google
  Future signInWithGoogle() async {
    //begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, let's sign in
   await FirebaseAuth.instance.signInWithCredential(credential);
    
  }
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Color.fromARGB(255, 6, 29, 64),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          color: Color.fromARGB(255, 80, 236, 189),
          onPressed: () {
            Navigator.pop(
              context,
            );
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      //backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              SizedBox(height: 0),

              // logo
              /*Image.asset(
                'lib/images/logo_pages.png',
                height: 90,
              ),*/

              SizedBox(height: 50),

              // Name textfield
              SizedBox(
                height: 55,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    style: TextStyle(
                        color: Color.fromARGB(212, 255, 255, 255),
                        fontSize: 20
                      ),
                    controller: nameController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                      hintText: "Full name",
                      prefixIcon: Icon(
                        Icons.account_circle_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 45, 45, 45),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                     fillColor: Color.fromRGBO(255,255, 255, 0.230),
                      filled: true,
                      focusColor: Color.fromRGBO(224, 224, 224, 0.230),
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15),

              // email textfield

              SizedBox(
                height: 55,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    style: TextStyle(
                        color: Color.fromARGB(211, 0, 0, 0),
                        fontSize: 20),
                    controller: emailController,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                      hintText: "email",
                      prefixIcon: Icon(
                        Icons.mail_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 45, 45, 45),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Color.fromRGBO(255,255, 255, 0.200),
                      filled: true,
                      focusColor: Color.fromRGBO(255, 255, 255, 0.200),
                    ),
                  ),
                ),
              ),

              // password textfield

              SizedBox(height: 15),
              SizedBox(
                height: 55,
                //height: MediaQuery.of(context).size.height * 0.05,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    style: TextStyle(
                        color: Color.fromARGB(212, 255, 255, 255),
                        fontSize: 20),
                    controller: passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 18),
                      hintText: "password (min 6 )",
                      prefixIcon: Icon(
                        Icons.lock_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 45, 45, 45),
                        ),
                        //borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        //borderSide: BorderSide(color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                      fillColor: Color.fromRGBO(255,255, 255, 0.200),
                      filled: true,
                      focusColor: Color.fromRGBO(255, 255, 255, 0.200),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15),
              
              // Phone number textfield

              SizedBox(
                height: 55,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0),
                  child: TextField(
                    style: TextStyle(
                        color: Color.fromARGB(212, 255, 255, 255),
                        fontSize: 20),
                    controller: phoneController,
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Color.fromARGB(255, 218, 218, 218), fontSize: 18),
                      hintText: "mobile number",
                      prefixIcon: Icon(
                        Icons.phone_rounded,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromARGB(255, 45, 45, 45),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      fillColor: Color.fromRGBO(255,255, 255, 0.200),
                      filled: true,
                      focusColor: Color.fromRGBO(255, 255, 255, 0.200),
                    ),
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
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 255, 134, 221),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
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
                        style: TextStyle(
                            color: Color.fromARGB(255, 158, 158, 158)),
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

              // Sign up with google
              GestureDetector(
                onTap: signInWithGoogle,
                child: Container(
                  height: 55,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  decoration: BoxDecoration(
                    //color: Color.fromARGB(255, 22, 33, 126),
                    color: Color.fromARGB(255, 255, 245, 135),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Center(
                    // child: OutlinedButton.icon(
                    //   onPressed: () {},
                    //   icon: Image.asset(
                    //     'lib/images/google.png',
                    //     width: 20.0,
                    //   ),
                    //   label: const Text("Sign up with google"),
                    // ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       /* Image.asset(
                          'lib/images/google.png',
                          width: 20.0,
                        ),*/
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          "Sign up with google",
                          style: TextStyle(
                            //color: Color.fromARGB(210, 255, 255, 255),
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}