import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CalculateFineScreen extends StatefulWidget {
  @override
  _CalculateFineScreenState createState() => _CalculateFineScreenState();
}

class _CalculateFineScreenState extends State<CalculateFineScreen> {
  final TextEditingController minutesController = TextEditingController();
  int fine = 0;

  void calculateFine() async {
    if (minutesController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please enter the minutes late")),
      );
      return;
    }

    try {
      final rules = await FirebaseFirestore.instance.collection('rules').doc('current').get();
      final finePerMinute = rules['finePerMinute'] as num;
      setState(() {
        fine = (int.parse(minutesController.text) * finePerMinute).toInt();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error calculating fine: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculate Fine'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: minutesController,
              decoration: InputDecoration(
                labelText: 'Minutes Late',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFine,
              child: Text('Calculate Fine'),
            ),
            SizedBox(height: 20),
            Text(
              'Fine Amount: \$${fine.toString()}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
