// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:student_details_app/model/model_db.dart';
// import 'package:student_details_app/screens/home_screen.dart';



// class ScreenUpdate extends StatelessWidget {
//   final Studentmodel studentDetails;

//   ScreenUpdate({super.key, required this.studentDetails});

// //   @override
// //   State<ScreenUpdate> createState() => _ScreenUpdateState();
// // }

// // class _ScreenUpdateState extends State<ScreenUpdate> {

//   // late TextEditingController _nameController;
//   // late TextEditingController _ageController;
//   // late TextEditingController _addressController;
//   // late TextEditingController _mobileController;

//   // @override
//   // void initState() {
//   //   super.initState();
//   // _nameController = TextEditingController(text: widget.studentDetails.name);
//   // _ageController = TextEditingController(text: widget.studentDetails.age);
//   // _addressController =
//   //     TextEditingController(text: widget.studentDetails.address);
//   // _mobileController =
//   //     TextEditingController(text: widget.studentDetails.mobile);
//   //}

//   // @override
//   // void dispose() {
//   // _nameController.dispose();
//   // _ageController.dispose();
//   // _addressController.dispose();
//   // _mobileController.dispose();
//   //   super.dispose();
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.yellow,
//         title: const Text(
//           'Update',
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(10),
//               child: Container(
//                 height: 500,
//                 width: MediaQuery.of(context).size.width,
//                 decoration: BoxDecoration(
//                   border: Border.all(
//                     color: Colors.grey,
//                     width: 2.0,
//                   ),
//                   borderRadius: BorderRadius.circular(8.0),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: [
//                       TextFormField(
//                         controller: _nameController,
//                         decoration: const InputDecoration(
//                             hintText: 'Name',
//                             suffixIcon: Icon(
//                               Icons.abc,
//                             )),
//                       ),
//                       TextFormField(
//                         controller: _ageController,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.class_,
//                           ),
//                           hintText: 'Age',
//                         ),
//                       ),
//                       TextFormField(
//                         controller: _addressController,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.person_2_rounded,
//                           ),
//                           hintText: 'Address',
//                         ),
//                       ),
//                       TextFormField(
//                         controller: _mobileController,
//                         keyboardType: TextInputType.number,
//                         decoration: const InputDecoration(
//                           suffixIcon: Icon(
//                             Icons.phone,
//                           ),
//                           hintText: 'Mobile',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 updateStudent(
//                   widget.studentDetails.id!,
//                   _nameController.text,
//                   _ageController.text,
//                   _addressController.text,
//                   _mobileController.text,
//                 );
//                 Navigator.push(context,
//                     MaterialPageRoute(builder: (ctx) => const ScreenHome()));
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   const SnackBar(
//                     content: Text('Successfully Updated'),
//                     behavior: SnackBarBehavior.floating,
//                     margin: EdgeInsets.all(10),
//                     backgroundColor: Colors.green,
//                   ),
//                 );
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
//               child: const Text(
//                 'Update',
//                 style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 25,
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
