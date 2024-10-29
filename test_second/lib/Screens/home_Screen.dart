import 'dart:io' show Platform;
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';

import '../wigdets/Tile_container.dart';
import '../wigdets/main_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Uint8List? bytesFromPicker;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text(
          "Dashboard",
          style: TextStyle(
              color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              height: 40,
              width: 40,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                "assets/imge.png",
                fit: BoxFit.cover,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            MainContainer(),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "DAILY SPENDS",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 180,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(30)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    TileContainer(
                      title: 'Net Banking',
                      price: '\$365.89',
                      lable: 'Today',
                      icon: Icons.home,
                      color: Colors.red,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TileContainer(
                      title: 'Food & Drinks',
                      price: '\$165.99',
                      lable: '26 jan, 2019',
                      icon: Icons.emoji_food_beverage_outlined,
                      color: Colors.amber,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TileContainer(
                      title: 'Clothes',
                      price: '\$365.89',
                      lable: '15 Jan, 2019',
                      icon: Icons.whatshot_outlined,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 5, right: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "WISHLIST",
                    style: TextStyle(color: Colors.grey, fontSize: 10),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      InkWell(
                        child: Container(
                          height: 94,
                          width: 94,
                          decoration: BoxDecoration(
                              color: Colors.indigo,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}


