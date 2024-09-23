import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Receivehistory extends StatefulWidget {
  const Receivehistory({Key? key}) : super(key: key);

  @override
  State<Receivehistory> createState() => _ReceivehistoryState();
}

class _ReceivehistoryState extends State<Receivehistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.white,
            Colors.white,
            Colors.teal
          ]
        )
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: Text("History"),
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
        ),
      ),
    );
  }
}
