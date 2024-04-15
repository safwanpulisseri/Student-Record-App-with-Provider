import 'package:flutter/material.dart';
import 'package:student_details_app/model/model_db.dart';

class Editcontroll extends ChangeNotifier {
  void oninit(Studentmodel data) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _id = data.id!;
      _namecontroller.text = data.name;
      _agecontroller.text = data.age;
      _addresscontroller.text = data.address;
      _mobilecontroller.text = data.mobile;

      notifyListeners();
    });
  }

  TextEditingController get namecontroller => _namecontroller;

  TextEditingController get agecontroller => _agecontroller;

  TextEditingController get addresscontroller => _addresscontroller;

  TextEditingController get phonecontroller => _mobilecontroller;

  final TextEditingController _namecontroller = TextEditingController();

  final TextEditingController _agecontroller = TextEditingController();

  final TextEditingController _addresscontroller = TextEditingController();

  final TextEditingController _mobilecontroller = TextEditingController();

  int get id => _id;
  int _id = 0;
  Studentmodel? student;
  Editcontroll({this.student});
}
