
/*import 'package:flutter/material.dart';
import 'package:wifi_flutter/wifi_network.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
// ignore: depend_on_referenced_packages
//import 'package:connectivity/connectivity.dart';

class WifiNetworkList extends StatefulWidget {
  @override
  _WifiNetworkListState createState() => _WifiNetworkListState();
}

class _WifiNetworkListState extends State<WifiNetworkList> {
  List<WifiNetwork> wifiList = [];

  @override
  void initState() {
    super.initState();
    getAvailableWifiNetworks();
  }

  Future<void> getAvailableWifiNetworks() async {
    try {
      await WifiInfoFlutter.requestLocationPermission();
      wifiList = await WifiInfoFlutter().getWifiList();
      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> connectToWifi(WifiNetwork wifi) async {
    try {
      bool isConnected = await WifiInfoFlutter().connectToWifi(wifi.ssid);
      if (isConnected) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Success'),
            content: Text('Connected to ${wifi.ssid}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Error'),
            content: Text('Failed to connect to ${wifi.ssid}'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('OK'),
              ),
            ],
          ),
        );
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Wi-Fi Networks'),
      ),
      body: ListView.builder(
        itemCount: wifiList.length,
        itemBuilder: (context, index) {
          final wifi = wifiList[index];
          return ListTile(
            title: Text(wifi.ssid),
            subtitle: Text(wifi.ssid),
            onTap: () => connectToWifi(wifi),
          );
        },
      ),
    );
  }
}

class WifiInfoFlutter {
  static requestLocationPermission() {}
  
  connectToWifi(String ssid) {}
  
  getWifiList() {}
}

void main() {
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
}*/