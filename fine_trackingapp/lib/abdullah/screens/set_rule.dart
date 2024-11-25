import 'package:flutter/material.dart';

class SetRulesScreen extends StatelessWidget {
  final TextEditingController fineRateController = TextEditingController();
  final TextEditingController lateLimitController = TextEditingController();

  SetRulesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Set Rules'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: fineRateController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Fine per minute'),
            ),
            SizedBox(height: 20),
            TextField(
              controller: lateLimitController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: 'Late limit per month'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Save rules to database or local storage
                final fineRate = int.tryParse(fineRateController.text) ?? 5;
                final lateLimit = int.tryParse(lateLimitController.text) ?? 5;

                // Store these values globally or in Firebase for calculation
                print('Fine Rate: $fineRate');
                print('Late Limit: $lateLimit');
              },
              child: Text('Save Rules'),
            ),
          ],
        ),
      ),
    );
  }
}
