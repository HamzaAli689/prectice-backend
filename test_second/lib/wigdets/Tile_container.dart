import 'package:flutter/material.dart';

class TileContainer extends StatelessWidget {
  String title;
  String price;
  String lable;
  IconData icon;
  Color color;

  TileContainer(
      {super.key,
      required this.title,
      required this.price,
      required this.lable,
      required this.icon,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: color, borderRadius: BorderRadius.circular(10)),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
                Text(
                  price,
                  style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
        Text(
          lable,
          style: TextStyle(color: Colors.grey, fontSize: 14),
        ),
      ],
    );
  }
}
