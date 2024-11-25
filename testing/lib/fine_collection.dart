import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FineCalculator extends StatefulWidget {
  @override
  _FineCalculatorState createState() => _FineCalculatorState();
}

class _FineCalculatorState extends State<FineCalculator> {
  final TextEditingController minutesController = TextEditingController();
  int fine = 0;

  void calculateFine() async {
    final rules = await FirebaseFirestore.instance.collection('rules').doc('current').get();
    final finePerMinute = rules['finePerMinute'] as num; // Explicitly treat it as num
    setState(() {
      fine = (int.parse(minutesController.text) * finePerMinute).toInt(); // Convert result to int
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fine Calculator')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: minutesController,
              decoration: InputDecoration(labelText: 'Minutes Late'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: calculateFine,
              child: Text('Calculate Fine'),
            ),
            SizedBox(height: 20),
            Text('Fine Amount: \$${fine.toString()}'),
          ],
        ),
      ),
    );
  }
}
