import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'favourite_provider.dart';

class MyFavouriteScreen extends StatefulWidget {
  const MyFavouriteScreen({super.key});

  @override
  State<MyFavouriteScreen> createState() => _MyFavouriteScreenState();
}

class _MyFavouriteScreenState extends State<MyFavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    final favouriteProviderObj = Provider.of<FavouriteProviderClass>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("My Favourites"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProviderObj.favouriteList.length,
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
                        title: Text(
                            "Item No " + value.favouriteList[index].toString()),
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
