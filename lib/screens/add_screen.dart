import 'package:flutter/material.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';

class ScreenAdd extends StatefulWidget {
  const ScreenAdd({super.key});

  @override
  State<ScreenAdd> createState() => _ScreenAddState();
}

class _ScreenAddState extends State<ScreenAdd> {
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: _validation,
                child: Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Student Name';
                            }
                            return null;
                          },
                          controller: _namecontroller,
                          decoration: const InputDecoration(
                              hintText: 'Name',
                              suffixIcon: Icon(
                                Icons.abc,
                              )),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Class';
                            }
                            return null;
                          },
                          controller: _agecontroller,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.class_,
                            ),
                            hintText: 'Age',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Guardian Name';
                            }
                            return null;
                          },
                          controller: _addresscontroller,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.person_2_rounded,
                            ),
                            hintText: 'Address',
                          ),
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter a Phone Number';
                            } else if (value.length != 10) {
                              return 'Please enter ten digits Phone Number';
                            }
                            return null;
                          },
                          controller: _mobilecontroller,
                          keyboardType: TextInputType.number,
                          decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.phone,
                            ),
                            hintText: 'Phone',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                addStudentClicked(context);
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

  Future<void> addStudentClicked(BuildContext context) async {
    final name = _namecontroller.text.trim();
    final age = _agecontroller.text.trim();
    final address = _addresscontroller.text.trim();
    final mobile = _mobilecontroller.text.trim();

    if (_validation.currentState!.validate()) {
      final student = Studentmodel(
        name: name,
        age: age,
        address: address,
        mobile: mobile,
      );
      await addStudent(student);

      Navigator.of(context).pop();
      clearStudentProfilephoto();
      submitbuttondetailsok(name);
    } else {
      submitbuttondetailnotok();
    }
  }

  clearStudentProfilephoto() {
    _namecontroller.text = '';
    _agecontroller.text = '';
    _addresscontroller.text = '';
    _mobilecontroller.text = '';
  }

  submitbuttondetailsok(data) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.green,
        margin: const EdgeInsets.all(10),
        content: Text(
          '$data\'s Details Added',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  submitbuttondetailnotok() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        duration: Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(10),
        content: Text(
          'Please fill in all mandatory fields',
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
