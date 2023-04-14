import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_tutorials/favourite_provider.dart';
import 'package:provider_tutorials/myFavourites_screen.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

List<int> favouriteList = [];

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    print("Built");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Favourites App"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyFavouriteScreen()));
            },
            child: Icon(Icons.favorite_outline_sharp),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: 50,
                itemBuilder: (context, index) {
                  return Consumer<FavouriteProviderClass>(
                    builder: (context, value, child) {
                      return ListTile(
                        onTap: () {
                          if (value.favouriteList.contains(index)) {
                            value.removeFromList(index);
                          } else {
                            value.addIntoList(index);
                          }
                        },
                        title: Text("Item No " + index.toString()),
                        trailing: value.favouriteList.contains(index)
                            ? Icon(Icons.favorite)
                            : Icon(Icons.favorite_outline),
                      );
                    },
                  );
                }),
          )
        ],
      ),
    );
  }
}
