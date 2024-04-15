import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/model/model_db.dart';
import 'package:student_details_app/screens/add_screen.dart';
import 'package:student_details_app/screens/details_screen.dart';
import 'package:student_details_app/screens/search.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: const Text(
          'Student Record',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              // showSearch(
              //   context: context,
              //   delegate: StudentSearchDelegate(),
              // );
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),

        child: Consumer<Studentcontoller>(
          builder: (context, value, child) {
            final values = value.students;
            if (values.isEmpty) {
              return const Center(
                child: Text(
                  'No student records found.',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }

            return GridView.builder(
              scrollDirection: Axis.vertical,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: values.length,
              itemBuilder: (ctx, index) {
                final data = values[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ScreenDetails(studentdetails: data),
                      ),
                    );
                  },
                  child: Card(
                    color: Colors.black45,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Name: ${data.name}',
                              style: const TextStyle(color: Colors.white),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'Age: ${data.age}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),

        // ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.yellow,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ScreenAdd()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
