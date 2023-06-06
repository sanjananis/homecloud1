
import 'package:flutter/material.dart';
import 'package:wifi_info_flutter/wifi_info_flutter.dart';
import 'package:wifi_flutter/wifi_flutter.dart';

    //Define a stateful widget that retrieves and displays the available Wi-Fi devices:

dart

class WifiDeviceList extends StatefulWidget {
  @override
  _WifiDeviceListState createState() => _WifiDeviceListState();
}

class _WifiDeviceListState extends State<WifiDeviceList> {
  List<WifiNetwork> wifiList = [];

  @override
  void initState() {
    super.initState();
    getAvailableWifiDevices();
  }

  Future<void> getAvailableWifiDevices() async {
    try {
      // Request permission to access Wi-Fi information
      await WifiInfoFlutter.requestLocationPermission();

      // Get the list of available Wi-Fi devices
      wifiList = await WifiInfoFlutter.wifiDetails;

      setState(() {});
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Available Wi-Fi Devices'),
      ),
      body: ListView.builder(
        itemCount: wifiList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(wifiList[index].ssid),
            subtitle: Text(wifiList[index].bssid),
            onTap: () {
              // Connect to the selected Wi-Fi device
              WifiFlutter.connect(wifiList[index].ssid).then((value) {
                if (value) {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text('Success'),
                      content: Text('Connected to ${wifiList[index].ssid}'),
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
                      content: Text('Failed to connect to ${wifiList[index].ssid}'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              });
            },
          );
        },
      ),
    );
  }
}

   // Use the WifiDeviceList widget in your app's main widget or any other relevant part:

dart

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
      home: WifiDeviceList(),
    );
  }
}