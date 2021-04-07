// import 'package:flutter/material.dart';
// import 'package:flutter_movie_app/api_provider.dart';
//
// class FutureBuilderWidget extends StatelessWidget {
//
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<Map>(
//       future: ImageUrl().getImageUrl(), // function where you call your api
//       builder: (BuildContext context, AsyncSnapshot snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else {
//           if (snapshot.hasError)
//             return Center(child: Text('Error: ${snapshot.error}'));
//           else
//             return Text(
//                 '${snapshot.data['secure_base_url']}',//from the future function
//               );
//
//         }
//       },
//     );
//   }
// }