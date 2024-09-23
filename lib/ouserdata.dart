import 'package:flutter/material.dart';
class ouserdata extends StatefulWidget {
  const ouserdata({Key? key}) : super(key: key);

  @override
  State<ouserdata> createState() => _ouserdataState();
}

class _ouserdataState extends State<ouserdata> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Food Details"),),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Provider:ABC',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'Phone no:9849697774',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'ABC hotel',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'yyy,123 456.',
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 10,
          ),

        ],
      ),
    );
  }
}
