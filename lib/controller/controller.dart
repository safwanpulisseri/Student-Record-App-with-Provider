import 'package:flutter/foundation.dart';
import 'package:sqflite/sqflite.dart';
import 'package:student_details_app/model/model_db.dart';

//ValueNotifier<List<Studentmodel>> studentlistNotifier = ValueNotifier([]);
class Studentcontoller extends ChangeNotifier {
  late Database _db;

  final List<Studentmodel> _students = [];

  Studentcontoller() {
    initializeDatabase();
    if (kDebugMode) {
      print('initialization done');
    }
  }
  Future<void> initializeDatabase() async {
    _db = await openDatabase('student.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE student(id INTEGER PRIMARY KEY ,name TEXT,age TEXT,address TEXT,mobile TEXT)');
    });

    // Retrieve data from the database during initialization
    getAllStudents();
  }

  Future<void> addStudent(Studentmodel value) async {
    await _db.rawInsert(
        'INSERT INTO student(name,age,address,mobile)VALUES(?,?,?,?)',
        [value.name, value.age, value.address, value.mobile]);
    getAllStudents();
  }

  List<Studentmodel> get students => _students;

  Future<void> getAllStudents() async {
    final values = await _db.rawQuery('SELECT * FROM student');
    //studentlistNotifier.value.clear();
    _students.clear();
    for (var map in values) {
      final student = Studentmodel.fromMap(map);
      //  studentlistNotifier.value.add(student);
      _students.add(student);
    }
    //studentlistNotifier.notifyListeners();
    notifyListeners();
  }

  Future<void> deleteStudent(int id) async {
    await _db.delete("student", where: "id=?", whereArgs: [id]);
    getAllStudents();
  }

  Future<void> updateStudent(
      int id, String name, String age, String address, String mobile) async {
    final data = {
      'name': name,
      'age': age,
      'address': address,
      'mobile': mobile,
    };
    await _db.update("student", data, where: 'id=?', whereArgs: [id]);
    getAllStudents();
  }
}
