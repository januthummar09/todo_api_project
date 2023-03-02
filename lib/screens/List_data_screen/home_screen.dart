import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http/retry.dart';

import '../../model/comment_model.dart';
import 'data_display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CommentModel> commentList = [];
  @override
  void initState() {
    super.initState();
    getCommentData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: ListView.separated(
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DataDisplayScreen(
                      postId: commentList[index].postId,
                      id: commentList[index].id,
                      name: commentList[index].name,
                      email: commentList[index].email,
                    ),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 15,
                ),
                child: Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "postId   :${commentList[index].postId}",
                          style: text(),
                        ),
                        Text(
                          "id       :${commentList[index].id}",
                          style: text(),
                        ),
                        Text(
                          "name     :${commentList[index].name}",
                          style: text(),
                        ),
                        Text(
                          "email   :${commentList[index].email}",
                          style: text(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 10,
              ),
          itemCount: commentList.length),
    );
  }

  getCommentData() async {
    http.Client client = http.Client();
    try {
      Response response = await client.get(
        Uri.parse("https://jsonplaceholder.typicode.com/posts/1/comments"),
      );
      if (response.statusCode == 200) {
        commentList = (jsonDecode(response.body) as List?)!
            .map((e) => CommentModel.fromJson(e))
            .toList();
        debugPrint("Data :${response.body}");
        setState(() {});
      } else {
        debugPrint("statusCode :${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }

  TextStyle text() {
    return const TextStyle(
      color: Colors.white,
      fontSize: 18,
    );
  }
}
