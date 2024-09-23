import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _Collection = _firestore.collection('My student');

class fooddetail extends StatefulWidget {
  final String? user;

  fooddetail({this.user});
  @override
  State<fooddetail> createState() => _fooddetailState(user: user);
}

class _fooddetailState extends State<fooddetail> {
  String? user;
  _fooddetailState({this.user});
  bool valuefirst = false;
  late String ph, fname, pname, add;
  late String quantity;
  getfood(String a) => fname = a;
  getprovider(String b) => pname = b;
  getquantity(String c) => quantity = c;
  getadd(String d) => add = d;
  getph(String e) => ph = e;
  Future createdata() async {
    DocumentReference documentReferencer = _Collection.doc();
    Map<String, dynamic> food = <String, dynamic>{
      "Food name": fname,
      "Provider": pname,
      "Quantity": quantity,
      "Address": add,
      "Phno": ph,
      "Transport": valuefirst
    };
    await documentReferencer
        .set(food)
        .whenComplete((){
      final snackBar = SnackBar(
        content: const Text('Successfully Added'),
        backgroundColor: (Colors.black12),
        action: SnackBarAction(
          label: '',
          onPressed: () {
          },
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    })
        .catchError((e) => print(e));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(10),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.teal,
                Colors.white,
                Colors.white,
              ]
          )
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: const Text("Food Details"),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      //Colors.purpleAccent,
                      Colors.black38,
                      Colors.teal,
                    ])),
          ),
          backgroundColor: Colors.transparent),
      body: ListView(
          //mainAxisAlignment: MainAxisAlignment.start,
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: const InputDecoration(
                    labelText: "Food name",
                    fillColor: Colors.white70,
                    focusColor: Colors.teal,
                    iconColor: Colors.teal,
                    labelStyle: TextStyle(color: Colors.black87),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                    ),
                    icon: Icon(Icons.food_bank)),
                onChanged: (String value) => getfood(value),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Provider name",
                      iconColor: Colors.teal,
                      fillColor: Colors.white70,
                      labelStyle: TextStyle(color: Colors.black87),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      icon: Icon(Icons.man)),
                  onChanged: (String value) => getprovider(value)),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  obscureText: false,
                  decoration: const InputDecoration(
                      labelText: "Quantity",
                      fillColor: Colors.white70,
                      iconColor: Colors.teal,
                      labelStyle: TextStyle(color: Colors.black87),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      icon: Icon(Icons.production_quantity_limits)),
                  onChanged: (String value) => getquantity(value)),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter the Address",
                      fillColor: Colors.white70,
                      iconColor: Colors.teal,
                      labelStyle: TextStyle(color: Colors.black87),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      icon: Icon(Icons.add_location)),
                  onChanged: (String value) => getadd(value)),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  decoration: const InputDecoration(
                      labelText: "Enter the Phone number",
                      fillColor: Colors.white70,
                      iconColor: Colors.teal,
                      labelStyle: TextStyle(color: Colors.black87),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      icon: Icon(Icons.add_call)),
                  onChanged: (value) => getph(value)),
            ),
            const SizedBox(
              height: 64,
            ),
            SizedBox(
              width: 375,
              child: Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(8.0, 0, 5, 0),
                    child: Icon(Icons.delivery_dining, color: Colors.teal),
                  ),
                  const Text("  Transport facility:",
                      style: TextStyle(fontSize: 17.5, color: Colors.black87)),
                  Checkbox(
                    checkColor: Colors.greenAccent,
                    activeColor: Colors.teal,
                    value: valuefirst,
                    onChanged: (bool? value) {
                      setState(() {
                        valuefirst = value!;
                      });
                    },
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(120, 150, 120, 0),
              child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black38),
                onPressed: () {

                  createdata();
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'Post',
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white70,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            /*Padding(
              padding: const EdgeInsets.fromLTRB(120, 70, 120, 0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.teal[400]),
                onPressed: () {
                  print(user);
                },
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    'check',
                    style: TextStyle(fontSize: 30, color: Colors.black54,fontWeight: FontWeight.bold),
                  ),
                ),),
            )*/
          ],
        ),
      ),
    );
  }
}
