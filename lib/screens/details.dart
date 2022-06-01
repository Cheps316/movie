// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'homepage.dart';

// class DetailsPage extends StatelessWidget {
//   DetailsPage({key});
//   var movie;

//   @override
//   Widget build(BuildContext context) {
//     final movie;
//     var size = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My App'),
//         actions: <Widget>[
//           IconButton(
//             icon: const Icon(
//               Icons.favorite_border_sharp,
//               color: Colors.white,
//             ),
//             onPressed: () {
//               // do something
//             },
//           )
//         ],
//       ),
//       body: SafeArea(
//         child: ClipRRect(
//           child: Column(
//             children: [
//               Container(
//                 width: size.width,
//                 height: size.height * 0.5,
//                 child: Image.network(
//                   "https://image.tmdb.org/t/p/w500/${movie['poster_path']}",
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               // Expanded(
//               //   child: Container(
//               //     child: ContainedTabBarView(
//               //       tabs: const <Widget>[
//               //         Text(
//               //           'Intro',
//               //           style: TextStyle(
//               //             color: Colors.black,
//               //           ),
//               //         ),
//               //         Text(
//               //           'Cast',
//               //           style: TextStyle(
//               //             color: Colors.black,
//               //           ),
//               //         ),
//               //         Text(
//               //           'Review',
//               //           style: TextStyle(
//               //             color: Colors.black,
//               //           ),
//               //         ),
//               //       ],
//               //       views: [
                      
//               //         Container(color: Colors.green),
//               //         Container(color: Colors.yellow),
//               //       ],
//               //       onChange: (index) => print(index),
//               //     ),
//               //   ),
//               // )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }