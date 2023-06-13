import 'package:flutter/material.dart';
//import 'package:ftpclient/ftpclient.dart';
import 'package:homecloud1/pages/main_page.dart';
//import 'package:homecloud1/pages/wifi_page.dart';
import 'pages/loginpage.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'firebase_options.dart';

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wi-Fi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WifiNetworkList(),
    );
  }
}

/*void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wi-Fi App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WifiDeviceList(),
    );
  }
}*/*/

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    //options: DefaultFirebaseOptions.currentPlatform,

  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(


      debugShowCheckedModeBanner: false,
    
      home: MainPage(),
    );
  }
}

/*Future<void> connectAndRetrieveFile() async {
  FTPClient ftpClient = FTPClient('your_ftp_server_address');

  try {
  
    ftpClient.connect();
    //await ftpClient.login(user: 'your_username', pass: 'your_password');

    //FTPFile file = await ftpClient.getFile('path_to_file_on_server');

    // Perform operations with the file, such as downloading or displaying it
    // Example: Download the file
    var file;
    String fileContents = await file.readAsString();
    print(fileContents);
  } catch (e) {
    print('Error: $e');
  } finally {
    ftpClient.disconnect();
  }
}

class FTPFile {
  readAsString() {}
}*/

