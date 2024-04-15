import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required GlobalKey<FormState> validation,
    required TextEditingController namecontroller,
    required TextEditingController agecontroller,
    required TextEditingController addresscontroller,
    required TextEditingController mobilecontroller,
  })  : _validation = validation,
        _namecontroller = namecontroller,
        _agecontroller = agecontroller,
        _addresscontroller = addresscontroller,
        _mobilecontroller = mobilecontroller;

  final GlobalKey<FormState> _validation;
  final TextEditingController _namecontroller;
  final TextEditingController _agecontroller;
  final TextEditingController _addresscontroller;
  final TextEditingController _mobilecontroller;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}
