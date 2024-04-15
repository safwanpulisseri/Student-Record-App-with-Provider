import 'package:flutter/material.dart';
import 'package:student_details_app/controller/add_update_functions.dart';
import 'package:student_details_app/widgets/text_form_fields.dart';

class ScreenAdd extends StatelessWidget {
  ScreenAdd({super.key});

  final GlobalKey<FormState> _validation = GlobalKey<FormState>();

  final _namecontroller = TextEditingController();

  final _agecontroller = TextEditingController();

  final _addresscontroller = TextEditingController();

  final _mobilecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Add',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormFieldWidget(
                validation: _validation,
                namecontroller: _namecontroller,
                agecontroller: _agecontroller,
                addresscontroller: _addresscontroller,
                mobilecontroller: _mobilecontroller),
            ElevatedButton(
              onPressed: () {
                addStudentClicked(
                    _namecontroller,
                    _agecontroller,
                    _addresscontroller,
                    _mobilecontroller,
                    _validation,
                    context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text(
                'Add',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
