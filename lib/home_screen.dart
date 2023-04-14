import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/provider/count_&_time_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 2), (timer) {
      final countClassObject =
          Provider.of<CountAndTimeProvider>(context, listen: false);
      countClassObject.addCount();
    });
  }

  Widget build(BuildContext context) {
    final countClassObject =
        Provider.of<CountAndTimeProvider>(context, listen: false);

    print("Build");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("State Management Tutorials"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Consumer<CountAndTimeProvider>(
              builder: (context, value, child) {
                return Text(
                  value.count.toString(),
                  style: TextStyle(fontSize: 40),
                );
              },
            ),
          ),
          Text(
            DateTime.now().hour.toString() +
                " : " +
                DateTime.now().minute.toString() +
                " : " +
                DateTime.now().second.toString(),
            style: TextStyle(fontSize: 40),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          countClassObject.addCount();
          print(countClassObject.count);
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
