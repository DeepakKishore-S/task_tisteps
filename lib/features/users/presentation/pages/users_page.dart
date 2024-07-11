// import 'package:flutter/material.dart';
// import 'package:tisteps_task/features/users/presentation/widget/user_card_widget.dart';

// class UsersPage extends StatefulWidget {
//   const UsersPage({super.key});

//   @override
//   State<UsersPage> createState() => _UsersPageState();
// }

// class _UsersPageState extends State<UsersPage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("List of Users"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Expanded(child: ListView.builder(
//               itemBuilder: (context, index) {
//                 return UserCardWidget(
//                     index: index,
//                     imageUrl:
//                         'https://plus.unsplash.com/premium_photo-1678197937465-bdbc4ed95815?q=40');
//               },
//             ))
//           ],
//         ),
//       ),
//     );
//   }
// }
