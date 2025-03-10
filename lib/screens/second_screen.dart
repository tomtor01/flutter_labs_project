import 'package:flutter/material.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key});

  @override
  SecondScreenState createState() => SecondScreenState();
}

class SecondScreenState extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: const Text('Second Page', style: TextStyle(fontWeight: FontWeight.bold)),
      ),
      body: Center(
        child: Text('Drugi ekran', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text('Add'),
        icon: const Icon(Icons.add),
      ),
    );
  }
}