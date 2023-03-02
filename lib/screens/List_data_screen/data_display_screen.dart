import 'package:flutter/material.dart';

class DataDisplayScreen extends StatefulWidget {
  final int? postId;
  final int? id;
  final String? name;
  final String? email;
  const DataDisplayScreen(
      {Key? key, this.id, this.postId, this.name, this.email})
      : super(key: key);

  @override
  State<DataDisplayScreen> createState() => _DataDisplayScreenState();
}

class _DataDisplayScreenState extends State<DataDisplayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Display screen"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    "Post Id :    ${widget.postId}",
                    style: text(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    "Id :    ${widget.id}",
                    style: text(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    "name :    ${widget.name}",
                    style: text(),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: double.infinity,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Text(
                    "email :    ${widget.email}",
                    style: text(),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle text() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
  }
}
