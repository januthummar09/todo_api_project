import 'package:flutter/material.dart';
import 'package:todo_api_project/screens/map_data_screen/alive_screen.dart';
import 'package:todo_api_project/utils/helper.dart';

import 'screens/List_data_screen/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class Listitem {
  String title;
  Widget child;
  Listitem({required this.title, required this.child});
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Helper helper = Helper();
  List<Listitem> item = [
    Listitem(
      title: "List Data Pass",
      child: const HomeScreen(),
    ),
    // Listitem(
    //   title: "Map Data Pass",
    //   child: const AliveScreen(),
    // ),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text(" List Screen"),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => item[index].child,
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 20,
                      ),
                      child: Text(
                        "Title : ${item[index].title}",
                        style: Helper.textDeco(),
                      ),
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
            itemCount: item.length),
      ),
    );
  }
}
