import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:student_details_app/controller/controller.dart';
import 'package:student_details_app/screens/edit_student/edit_conreoller.dart';
//import 'package:student_details_app/screens/home_screen.dart';
import 'package:student_details_app/screens/splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  var database = Studentcontoller();
  database.initializeDatabase();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Studentcontoller()),
        ChangeNotifierProvider(create: (context) => Editcontroll()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
          useMaterial3: true,
        ),
        home: const ScreenSplash(),
      ),
    );
  }
}
