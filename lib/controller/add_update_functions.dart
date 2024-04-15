import 'package:flutter/material.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/widgets/snackbar.dart';
import 'package:provider/provider.dart';

Future<void> addStudentClicked(namecontroller, agecontroller, addresscontroller,
    mobilecontroller, validation, context) async {
  final control = Provider.of<Studentcontoller>(context, listen: false);
  final name = namecontroller.text.trim();
  final age = agecontroller.text.trim();
  final address = addresscontroller.text.trim();
  final mobile = mobilecontroller.text.trim();

  if (validation.currentState!.validate()) {
    final student = Studentmodel(
      name: name,
      age: age,
      address: address,
      mobile: mobile,
    );
    //await addStudent(student);
    await control.addStudent(student);
    namecontroller.text = '';
    agecontroller.text = '';
    addresscontroller.text = '';
    mobilecontroller.text = '';
    Navigator.of(context).pop();
    // clearStudentProfilephoto();
    snackbar('Details Submitted', context);
  } else {
    snackbar('Please Add Details', context);
  }
}



//   _namecontroller.text = '';
//   _agecontroller.text = '';
//   _addresscontroller.text = '';
//   _mobilecontroller.text = '';
// 
