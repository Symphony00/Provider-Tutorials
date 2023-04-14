import 'dart:developer';

import 'package:flutter/material.dart';

class StlToStfWidget extends StatelessWidget {
  const StlToStfWidget({super.key});

  @override
  Widget build(BuildContext context) {
    print(build);
    ValueNotifier<int> counter = ValueNotifier(0);
    ValueNotifier<bool> show = ValueNotifier(true);
    return Scaffold(
      appBar: AppBar(
        title: Text("Stateless to Stateful"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ValueListenableBuilder(
            valueListenable: show,
            builder: (context, value, child) {
              return TextFormField(
                  obscureText: show.value,
                  decoration: InputDecoration(
                      hintText: "Type Here",
                      suffixIcon: InkWell(
                        onTap: () {
                          show.value = !show.value;
                        },
                        child: Icon(show.value
                            ? Icons.visibility
                            : Icons.visibility_off),
                      )));
            },
          ),
          ValueListenableBuilder(
            valueListenable: counter,
            builder: (context, value, child) {
              return Text(
                value.toString(),
                style: TextStyle(fontSize: 40),
              );
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.value++;
          print(counter.value.toString());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
