import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_page.dart';
import 'loginpage.dart';

class MainPage extends StatelessWidget{
  const MainPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot){
          /*if(snapshot.hasError){
            Text(snapshot.error.toString());
            return Center(child: Text('Something went wrong'));
          }*/
           if (snapshot.hasData){
            return HomePage();
          } 
          else {
            return LoginPage();
          }

          // if(snapshot.connectionState==ConnectionState.active){
          //   if(snapshot.hasData){
          //     return HomePage();
          //   }
          //   else{
          //     return LoginPage();
          //   }
          // }
          // else return LoginPage();
        },
      ),
    );
  }

}