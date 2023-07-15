// // ignore_for_file: prefer_const_constructors

// import 'dart:math';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';


// class FavouriteScreen extends StatefulWidget {
//    static const id = "/FavouriteScreen";
//   const FavouriteScreen({Key? key}) : super(key: key);

//   @override
//   State<FavouriteScreen> createState() => _FavouriteScreenState();
// }

// class _FavouriteScreenState extends State<FavouriteScreen> {
//   List ids = [];
//   getId() async {
//     FirebaseFirestore.instance
//         .collection('favourite')
//         .doc(FirebaseAuth.instance.currentUser!.uid)
//         .collection('items')
//         .get()
//         .then((QuerySnapshot<Map<String, dynamic>> snapshot) {
//       snapshot.docs.forEach((element) {
//         setState(() {
//           ids.add(element['pid']);
//         });
//       });
//     });
//   }

//   @override
//   void initState() {
//     getId();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//      // appBar:AppBar(
//       //   title: Title(color: Colors.blue, child: Text("Favorite")),
//       // ),
//       body: Center(
//         child: StreamBuilder(
//           stream: FirebaseFirestore.instance.collection('apartments').snapshots(),
//           builder:
//               (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
//             if (!snapshot.hasData) {
//               return CircularProgressIndicator();
//             }
//             if (snapshot.data == null) {
//               return Center(child: Text("No Favourite Items Found"));
//             }
//             List<QueryDocumentSnapshot<Object?>> fp = snapshot.data!.docs
//                 .where((element) => ids.contains(element["id"]))
//                 .toList();
//             return ListView.builder(
//               itemCount: fp.length,
//               itemBuilder: (BuildContext context, int index) {
//                 return Padding(
//                   padding:
//                       EdgeInsets.symmetric(horizontal: 50, vertical: 70),
//                   child: InkWell(
//                     onTap: () {
//                       // Navigator.push(
//                       //     context,
//                       //     MaterialPageRoute(
//                       //         builder: (_) => ProductDetailPage(
//                       //           id: fp[index]['id'],
//                       //         )));
//                     },
//                     child: Card(
//                         elevation: 10.0,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20)),
//                         color: Colors.black,
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: ListTile(
//                             title: Text(fp[index]['productName'],
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                 )),
//                             trailing: IconButton(
//                                 onPressed: () {},
//                                 icon: Icon(
//                                   Icons.navigate_next_outlined,
//                                   color: Colors.white,
//                                 )),
//                           ),
//                         )),
//                   ),
//                 );
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }