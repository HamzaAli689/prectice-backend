import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fine Dashboard')),
      body: Column(
        children: [
          Text('Welcome to Fine Management'),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/fine-calculator'),
            child: Text('Calculate Fine'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context, '/history'),
            child: Text('View History'),
          ),
        ],
      ),
    );
  }
}
