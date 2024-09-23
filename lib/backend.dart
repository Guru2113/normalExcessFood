// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second/main.dart';

import '../fooddetail.dart';

class backend extends StatefulWidget {
  const backend({Key? key}) : super(key: key);

  @override
  State<backend> createState() => _backendState();
}

class _backendState extends State<backend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(10),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //fColors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
            ]),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
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
        backgroundColor: Colors.transparent,
        title: const Text("Dashboard",style: TextStyle(fontSize: 30)),
        centerTitle: true,
      ),
      drawer: Drawer(
        backgroundColor: Colors.transparent,
        child: Column(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('abc', style: TextStyle(fontSize: 20)),
              accountEmail:
              Text('ABC@gmail.com', style: TextStyle(fontSize: 20)),
              decoration: BoxDecoration(color: Colors.teal),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.black45,
                child: Text('A',
                    style:
                    TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              ),
            ),
            const SizedBox(
              height: 400,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Third()));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                'Contact us',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        ),
      ),
      body: Center(
          child: ListView(children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fooddetail(user: "")));
              },
                style: ElevatedButton.styleFrom(

                    tapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent
                  // tapTargetSize:
                ),
                child:Padding(padding:const EdgeInsets.all(0),
                    child: Card(
                      color: Colors.transparent,
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(30.0),
                              child: Image.asset("Assets/Serve.png"),
                            ),
                            const Text(
                                'serve',
                                style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.w400)
                            )]
                      ),
                    )
                )
            ),
            // const SizedBox(height: 50),
            // ElevatedButton(
            //   onPressed: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (context) => const Request()));
            //   },
            //     style: ElevatedButton.styleFrom(
            //         tapTargetSize:
            //         MaterialTapTargetSize.shrinkWrap,
            //         backgroundColor: Colors.transparent,
            //         shadowColor: Colors.transparent
            //       // tapTargetSize:
            //     ),
            //     child:Padding(padding:const EdgeInsets.fromLTRB(0,0,0,0),
            //         child: Card(
            //           color: Colors.transparent,
            //           child: Column(
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.fromLTRB(72,30,72,30),
            //                   child: Image.asset("Assets/request final.png"),
            //                 ),
            //                 const Text(
            //                     'Receive',
            //                     style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.w400)
            //                 ),
            //                 const SizedBox(
            //                   height: 10,
            //                 )
            //               ]
            //           ),
            //         )
            //     )
            // ),
            // const SizedBox(height: 50),
          /*  ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Request()));
                },
                style: ElevatedButton.styleFrom(
                    tapTargetSize:
                    MaterialTapTargetSize.shrinkWrap,
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent
                  // tapTargetSize:
                ),
                child:Padding(padding:const EdgeInsets.fromLTRB(0,0,0,0),
                    child: Card(
                      color: Colors.transparent,
                      child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8,30,8,30),
                              child: Image.asset("Assets/Stat.png"),
                            ),
                            const Text(
                                'History',
                                style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.w400)
                            ),
                            const SizedBox(
                              height: 10,
                            )
                          ]
                      ),
                    )
                )
            )*/
          ]),
        ),
      ),
    );
  }
}
//final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// ignore: non_constant_identifier_names
//final CollectionReference _Collection = _firestore.collection('My student');
class Request extends StatefulWidget {
  const Request({Key? key}) : super(key: key);

  @override
  State<Request> createState() => _RequestState();
}

class _RequestState extends State<Request> {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(2, 50, 20,0),
    decoration: const BoxDecoration(
    gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
    //Colors.purple,
    Colors.white,
      Colors.white,
      Colors.teal,
    ],

    ),
    ),
    child: Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        title: const Text("Requested:",style: TextStyle(color: Colors.black,fontSize: 30)),
      ),
      body: StreamBuilder(
            stream:
            FirebaseFirestore.instance.collection("Request").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot documentSnapshot =
                    snapshot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.fromLTRB(25,25,10,25),
                      color: Colors.white,
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  Colors.blueGrey,
                                  Colors.teal
                                ]
                            )
                        ),
                        child: Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5.0, 8, 5, 2),
                              child: Row(
                                children: [
                                  const Text(" Food Name : ",
                                      style: TextStyle(fontSize: 18)),
                                  Text(documentSnapshot["Food name"],
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text(" Address : ",
                                      style: TextStyle(fontSize: 18)),
                                  Text(documentSnapshot["Address"],
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text(" Contact no : ",
                                      style: TextStyle(fontSize: 18)),
                                  Text(documentSnapshot["Phno"].toString(),
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text(" Provider : ",
                                      style: TextStyle(fontSize: 18)),
                                  Text(documentSnapshot["Provider"],
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: Row(
                                children: [
                                  const Text(" Quantity : ",
                                      style: TextStyle(fontSize: 18)),
                                  Text(documentSnapshot["Quantity"],
                                      style: const TextStyle(fontSize: 18)),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(5, 2, 5, 8),
                              child: Row(
                                children: [
                                  const Text(" Transport : ",
                                      style: TextStyle(fontSize: 18)),
                                  if (documentSnapshot["Transport"]=='true')
                                    const Text("Available",
                                        style: TextStyle(fontSize: 18))
                                  else
                                    const Text("Unavailable",
                                        style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ),
                            /*Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                    //Colors.purpleAccent,
                                    Colors.white12,
                                    Colors.black12
                                  ])),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    tapTargetSize:
                                    MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: Colors.transparent,
                                    shadowColor: Colors.transparent),
                                child: const Text("Request"),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            )*/
                          ],
                        ),
                      ),
                    );
                  },
                );
              } else {
                return const Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: CircularProgressIndicator(),
                );
              }
            },
          )
    ),
    );
  }
}
