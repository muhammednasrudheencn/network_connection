import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample/service/auth_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isalertset = false;
  @override
  void initState() {
    getConnectivity();
    super.initState();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && isalertset == false) {
        networkDialogue();
        setState(() => isalertset = true);
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await logout();
            Navigator.pop(context);
          },
          child: const Icon(Icons.logout),
        ),
        body: StreamBuilder(
          stream: Connectivity().onConnectivityChanged,
          builder: (context, AsyncSnapshot<ConnectivityResult> snapshot) {
            print(snapshot);
            if (snapshot.hasData) {
              ConnectivityResult? result = snapshot.data;
              if (result == ConnectivityResult.mobile) {
                return const Center(
                  child: Text(
                    'Internet Connected',
                    style: TextStyle(color: Colors.green),
                  ),
                );
              } else if (result == ConnectivityResult.wifi) {
                return const Center(
                  child: Text(
                    'Wifi Connected',
                    style: TextStyle(color: Colors.green),
                  ),
                );
              } else {
                return const Center(child: Text('no internet'));
              }
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ));
  }

  networkDialogue() {
    showDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text("Network Error"),
              actions: [
                CupertinoDialogAction(
                    onPressed: () async {
                      Navigator.pop(context, 'cancel');
                      setState(() => isalertset = false);
                      isDeviceConnected =
                          await InternetConnectionChecker().hasConnection;
                      if (!isDeviceConnected) {
                        networkDialogue();
                        setState(() => isalertset = true);
                      }
                    },
                    child: const Text("Ok")),
              ],
              content: const Text("Please connect your internet Connectivity"),
            ));
  }
}

Future logout() async {
  await googleSignIn.signOut();
}
