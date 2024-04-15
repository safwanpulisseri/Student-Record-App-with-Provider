import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/home_screen.dart';
import 'package:student_details_app/widgets/snackbar.dart';

class ScreenUpdate extends StatelessWidget {
  final Studentmodel studentDetails;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  ScreenUpdate({super.key, required this.studentDetails});

  @override
  Widget build(BuildContext context) {
    // Set initial values for controllers
    _nameController.text = studentDetails.name;
    _ageController.text = studentDetails.age;
    _addressController.text = studentDetails.address;
    _mobileController.text = studentDetails.mobile;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Update',
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
                        controller: _nameController,
                        decoration: const InputDecoration(
                            hintText: 'Name',
                            suffixIcon: Icon(
                              Icons.abc,
                            )),
                      ),
                      TextFormField(
                        controller: _ageController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.class_,
                          ),
                          hintText: 'Age',
                        ),
                      ),
                      TextFormField(
                        controller: _addressController,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.person_2_rounded,
                          ),
                          hintText: 'Address',
                        ),
                      ),
                      TextFormField(
                        controller: _mobileController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          suffixIcon: Icon(
                            Icons.phone,
                          ),
                          hintText: 'Mobile',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Call updateStudent method from the controller
                Provider.of<Studentcontoller>(context, listen: false)
                    .updateStudent(
                  studentDetails.id!,
                  _nameController.text,
                  _ageController.text,
                  _addressController.text,
                  _mobileController.text,
                );
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const ScreenHome()));
                snackbar('Details Updated', context);
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
              child: const Text(
                'Update',
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
