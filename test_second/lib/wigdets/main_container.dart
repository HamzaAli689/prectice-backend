import 'package:flutter/material.dart';

class MainContainer extends StatelessWidget {
  const MainContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.indigo,
          borderRadius: BorderRadius.circular(30)
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("January",style: TextStyle(color: Colors.white,fontSize: 15),),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("\$ 500", style: TextStyle(fontSize: 25,
                    color: Colors.white,fontWeight: FontWeight.bold),),
                Icon(Icons.add_chart_outlined,color: Colors.white,size: 25,)
              ],
            ),
            SizedBox(height: 7,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(height: 4,
                  width: 300,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),
                      color: Colors.white
                  ),
                ),
                Text("70%",style: TextStyle(fontSize: 17,
                    fontWeight: FontWeight.bold,color: Colors.white
                ),)
              ],
            ),
            SizedBox(height: 7,),
            Text("Daily spend target: \$16.67",style: TextStyle(color: Colors.white),)

          ],
        ),
      ),
    );
  }
}
