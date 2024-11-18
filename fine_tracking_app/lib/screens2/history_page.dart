import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  final List<Map<String, String>> fines = [
    {"date": "2024-11-01", "reason": "Late by 10 mins", "amount": "\$20"},
    {"date": "2024-11-05", "reason": "Late by 15 mins", "amount": "\$30"},
    {"date": "2024-11-12", "reason": "Late by 5 mins", "amount": "\$10"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fine History',style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blueGrey[800],
        actions: [
          IconButton(
            icon: Icon(Icons.filter_list),
            onPressed: () {
              // Handle filter logic (e.g., show filter dialog)
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by reason or date',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.search, color: Colors.white54),
                filled: true,
                fillColor: Colors.blueGrey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: fines.length,
                itemBuilder: (context, index) {
                  final fine = fines[index];
                  return Card(
                    color: Colors.blueGrey[800],
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListTile(
                      title: Text(
                        fine["reason"]!,
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        fine["date"]!,
                        style: TextStyle(color: Colors.white54),
                      ),
                      trailing: Text(
                        fine["amount"]!,
                        style: TextStyle(
                          color: Colors.cyanAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.cyanAccent,
        onPressed: () {
          // Open filter modal
        },
        child: Icon(Icons.filter_alt, color: Colors.black),
      ),
    );
  }
}
