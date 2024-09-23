import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:second/db/backend.dart';
// import 'package:second/db/Receivehistory.dart';
import 'package:second/fooddetail.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'firebase_options.dart';
String? _user, _pass;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate();
  await FirebaseAppCheck.instance.activate(
    // webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  );
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: FirstRoute(),
  ));
}

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // height: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(10),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      body: ListView(children: [
        Center(child: Text("Eat-N-Share",style: TextStyle(fontSize: 30))),
        SizedBox(
          height: 50,
        ),
            Image.asset('Assets/fooddemo2.png'),
            const SizedBox(
              height: 120,
            ),
            Container(
              color: Colors.transparent,
              child: Center(child: const Text('Login As', style: TextStyle(fontSize: 30))),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: const Text('      Hotel     ',
                    style: TextStyle(fontSize: 27.5)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SecondRoute()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                ),
                child: Container(
                  padding: EdgeInsets.fromLTRB(21, 8.5, 21, 8.5),
                    child: const Text('Orphanage', style: TextStyle(fontSize: 20))),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThirdRoute()),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Center(child: Text('Or',style: TextStyle(fontSize: 25))),
            const SizedBox(
              height: 15,
            ),
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ));
                },
                child: const Text('Create Account',
                    style: TextStyle(fontSize: 21.5, color: Colors.white)),
              ),
            )
          ])),
    );
  }

}

// ignore: non_constant_identifier_names
GlobalKey<FormState> Fkey = GlobalKey<FormState>();

void delay() {
  Future.delayed(
    const Duration(seconds: 4),
    () {},
  );
}

void signin(BuildContext context) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: _user!, password: _pass!)
      .catchError((onError) {
    // ignore: invalid_return_type_for_catch_error
    return "Username and password not match";
  }).then((authUser) {
    if (authUser.user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const Secondsub()));
    }
  });
}
void signiin(BuildContext context) async {
  await FirebaseAuth.instance
      .signInWithEmailAndPassword(email: _user!, password: _pass!)
      .catchError((onError) {
    // ignore: invalid_return_type_for_catch_error
    return "Username and password not match";
  }).then((authUser) {
    if (authUser.user != null) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const backend()));
    }
  });
}
class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      // height: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 100),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(10),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
            ]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
      body:Form(
          key: Fkey,
          child: ListView(children: [
            const Text("Hotel's Login:",style: TextStyle(fontSize: 30,color: Colors.black)),
            const SizedBox(
              height: 30,
            ),
            Image.asset('Assets/login.png'),
            const SizedBox(
              height: 50,
            ),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the username";
                } else if (!(RegExp(r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                    .hasMatch(value))) {
                  return "Enter a valid email id ";
                } else {
                  _user = value;
                }
                return null;
              },
              onSaved: (String? value) {
                _user = value!;
              },
              decoration: const InputDecoration(
                iconColor: Colors.teal,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  icon: Icon(Icons.account_circle), hintText: "Username"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              validator: (String? pass) {
                if (pass!.isEmpty) {
                  return "Enter the Password";
                } else {
                  if (!(pass.length > 8 && pass.length < 15)) {
                    return "Password length must greater than 8 and less than 15";
                  }
                  return null;
                }
              },
              onSaved: (String? pass) => _pass = pass!,
              decoration: const InputDecoration(
                iconColor: Colors.teal,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  icon: Icon(Icons.lock), hintText: "Password"),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                if (Fkey.currentState!.validate()) {
                  Fkey.currentState!.save();
                  signiin(context);
                }
              },
              child: const Text('Login'),
            ),
          ]),
        ),
      ),
    );
  }
}

class ThirdRoute extends StatelessWidget {
  const ThirdRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: const EdgeInsets.fromLTRB(20, 70, 20, 10),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(10),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
            ]),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      body:Form(
          key: Fkey,
          child: ListView(children: [
            const Text("Orphanage's Login:",style: TextStyle(fontSize: 25)),
            Image.asset('Assets/login.png'),
            TextFormField(
              validator: (value) {
                if (value!.isEmpty) {
                  return "Enter the username";
                } else if (!(RegExp(r"""
^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""")
                    .hasMatch(value))) {
                  return "Enter a valid email id ";
                } else {
                  _user = value;
                }
                return null;
              },
              onSaved: (String? value) {
                _user = value!;
              },
              decoration: const InputDecoration(
                iconColor: Colors.teal,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  icon: Icon(Icons.account_circle), hintText: "Username"),
            ),
            const SizedBox(height: 20),
            TextFormField(
              obscureText: true,
              validator: (String? pass) {
                if (pass!.isEmpty) {
                  return "Enter the Password";
                } else {
                  if (!(pass.length > 8 && pass.length < 15)) {
                    return "Password length must greater than 8 and less than 15";
                  }
                  return null;
                }
              },
              onSaved: (String? pass) => _pass = pass!,
              decoration: const InputDecoration(
                iconColor: Colors.teal,
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  icon: Icon(Icons.lock), hintText: "Password"),
            ),
            const SizedBox(height: 70),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              onPressed: () {
                if (Fkey.currentState!.validate()) {
                  Fkey.currentState!.save();
                  signin(context);
                }
              },
              child: const Text('Login'),
            ),
          ]),
        ),
      ),
    );
  }
}

class Secondsub extends StatelessWidget {
  const Secondsub({Key? key}) : super(key: key);

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
              //Colors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
            ]),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: Text("Dashboard"),
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
        backgroundColor: Colors.transparent,
      ),
      drawer: Drawer(
        backgroundColor: Colors.white12,
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
            //SizedBox(height: 170,),
           /* ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => fooddetail(user: _user)));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
              ),
              child: const Text(
                'Serve',
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400),
              ),
            ),*/
            const SizedBox(height: 170),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Receive()));
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
                    Image.asset("Assets/receivepng.png"),
                  const Text(
                  'Receive',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400)
                  )]
                ),
              )
              ),),
            SizedBox(
              height: 20,
            ),
          /*  ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Receivehistory()));
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
                            padding: const EdgeInsets.fromLTRB(20,30,20,0),
                            child: Image.asset("Assets/Stat.png"),
                          ),
                          const Text(
                              'History',
                              style: TextStyle(fontSize: 50, fontWeight: FontWeight.w400)
                          ),
                          SizedBox(
                            height: 20,
                          )
                        ]
                    ),
                  )
              ),),*/
          ]),
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  const Third({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.fromLTRB(20, 100, 20, 100),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(10),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                //Colors.purple,
                Colors.teal,
                Colors.white,
                Colors.white,
              ]),
        ),
        child: Scaffold(backgroundColor: Colors.transparent,
        body:  ListView(children: [
          Center(child: const Text('contact us', style: TextStyle(fontSize: 40))),
          const SizedBox(
            height: 40,
          ),
          Center(child: const Text('Gmail:abc@gmail.com', style: TextStyle(fontSize: 30))),
          const SizedBox(
            height: 40,
          ),
          Center(child: const Text('Phone number:1234567890', style: TextStyle(fontSize: 30))),
          const SizedBox(
            height: 500,
          ),
          Center(child: const Text('Any complaints', style: TextStyle(fontSize: 40))),
          const SizedBox(
            height: 20,
          ),
          Center(
            child: ElevatedButton(
                onPressed: () async {
                  const url =
                      'https://docs.google.com/forms/d/e/1FAIpQLSdOFfLsg45x9aTKyB1TFRIeEaj-YzV73UeHHXAxXwXTs5NGRg/viewform?vc=0&c=0&w=1&flr=0';
                  if (await canLaunchUrl(url as Uri)) {
                    await launchUrl(
                      url as Uri,
                      //forceSafariVC: true,
                      //forceWebView: true,
                      //enableJavaScript: true,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent
                ),
                child: const Text("Contact us")),
          )
      ]),

    ));
  }
}

class Serve extends StatelessWidget {
  const Serve({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 150, 20, 100),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(10),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
            ]),
      ),

      child: Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: const Text('Serve',),
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
          children: [
            Card(
              color: Colors.transparent,
              child: Column(children: [
                Image.asset('Assets/jd.jpg'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Provider:ABC',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Phone no:9849697774',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'ABC hotel',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'yyy,123 456.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(
                  height: 10,
                ),
              ]),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => fooddetail(user: _user),
                ));
          },
          backgroundColor: Colors.black54,
          child: const Icon(Icons.add, size: 20),
        ),
      ),
    );
  }
}

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
// ignore: non_constant_identifier_names
final CollectionReference _Collection = _firestore.collection('Request');

class Receive extends StatelessWidget {
  Receive({Key? key}) : super(key: key);

  static Stream<QuerySnapshot> readFood() {
    CollectionReference notesItemCollection = _Collection;
    return notesItemCollection.snapshots();
  }
  Future createdata(String fname,String pname,String quantity,String add,String ph,String valuefirst) async {
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
        .whenComplete(() => print("Successfull"))
        .catchError((e) => print(e));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            transform: GradientRotation(10),
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              //Colors.purple,
              Colors.teal,
              Colors.white,
              Colors.white,
              //Colors.greenAccent,

            ]),
      ),
      child: Scaffold(backgroundColor: Colors.transparent,
      appBar: AppBar(
          title: const Text('Receive'),
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
                FirebaseFirestore.instance.collection("My student").snapshots(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot documentSnapshot =
                        snapshot.data!.docs[index];
                    return Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.transparent,
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
                                  if (documentSnapshot["Transport"])
                                    const Text("Available",
                                        style: TextStyle(fontSize: 18))
                                  else
                                    const Text("Unavailable",
                                        style: TextStyle(fontSize: 18))
                                ],
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                  gradient: LinearGradient(colors: [
                                //Colors.purpleAccent,
                                Colors.white12,
                                Colors.black12
                              ])),
                              child: ElevatedButton(
                                onPressed: () {
                                  createdata ( documentSnapshot["Food name"].toString(),
                                  documentSnapshot["Provider"].toString(),
                                  documentSnapshot["Quantity"].toString(),
                                  documentSnapshot["Address"].toString(),
                                  documentSnapshot["Phno"].toString(),
                                  documentSnapshot["Transport"].toString());
                                },
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
                            )
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
          )),
    );

  /* */
  }
}

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final email= TextEditingController();
    final pass= TextEditingController();
    return Container(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 50),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              transform: GradientRotation(10),
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                //Colors.purple,
                Colors.teal,
                Colors.white,
                Colors.white,
              ]),
        ),
        child:Scaffold(backgroundColor: Colors.transparent,
        body:  Form(
        child: ListView(
          children: [
            const Center(
                child: Text(
              "Join Us!...",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.bold),
            )),
            const SizedBox(
              height: 20,
            ),
            Image.asset("Assets/createacc.png"),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: email,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                iconColor: Colors.teal,
                  hintText: "Enter the Email",
                  icon: Icon(Icons.account_box_rounded)),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              obscureText: true,
              controller: pass,
              decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.teal, width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(5.0))),
                  iconColor: Colors.teal,
                  hintText: "Enter Password(more than 8 and less than 15 char)",
                  icon: Icon(Icons.account_balance_wallet)),
            ),
            const SizedBox(
              height: 20,
            ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.teal, width: 2),
            //           borderRadius: BorderRadius.all(Radius.circular(5.0))),
            //       iconColor: Colors.teal,
            //       hintText: "Enter the Address",
            //       icon: Icon(Icons.add_location)),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // TextFormField(
            //   decoration: const InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //           borderSide: BorderSide(color: Colors.teal, width: 2),
            //           borderRadius: BorderRadius.all(Radius.circular(5.0))),
            //       iconColor: Colors.teal,
            //       hintText: "Enter the Phone number",
            //       icon: Icon(Icons.add_call)),
            // ),
            // const SizedBox(
            //   height: 70,
            // ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent),
                onPressed: () async{
                  try{
                  final firestore = FirebaseFirestore.instance;
                  UserCredential _cre = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(email: email.text, password: pass.text);

                  const snackBar = SnackBar(
                    content: Text('Created Successfully',style: TextStyle(color: Colors.green)),
                  );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                  }
                  on FirebaseException catch (e){
                    const snackBar = SnackBar(
                      content: Text('Error',style: TextStyle(color: Colors.red)),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text(
                  'Create',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black54,
                      fontWeight: FontWeight.bold),
                ))
          ],
        ),
      ),
    ));
  }
}
