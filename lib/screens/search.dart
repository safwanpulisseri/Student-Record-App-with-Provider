import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/details_screen.dart';

class StudentSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        color: Colors.black,
        onPressed: () {
          query = '';
        },
        icon: const Icon(
          Icons.clear,
        ),
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      color: Colors.black,
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: const Icon(
        Icons.arrow_back,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // Not used as we're showing results in the home screen itself
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // final List<Studentmodel> suggestionList = studentlistNotifier.value
    //     .where((student) =>
    //         student.name.toLowerCase().contains(query.toLowerCase()))
    //     .toList();

    // if (suggestionList.isEmpty) {
    //   return const Center(
    //     child: Text(
    //       'No students found.',
    //       style: TextStyle(
    //         fontSize: 20,
    //       ),
    //     ),
    //   );
    // }
    return Consumer<Studentcontoller>(builder: (context, controller, child) {
      List filtered1 = controller.students;
      final filtered = filtered1
          .where((element) =>
              element.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
      if (filtered.isEmpty) {
        return const Center(
          child: Text(
            'No students found.',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        );
      }

      return ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final Studentmodel student = filtered[index];
          return ListTile(
            title: Text(student.name),
            onTap: () {
              // Navigator.push(
              //   context,
              // MaterialPageRoute(
              //   builder: (ctx) => ScreenDetails(
              //     studentdetails: student,
              //     value: value,
              //   ),
              // ),
              // );
            },
          );
        },
      );
    });
  }
}
