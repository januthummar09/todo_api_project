import 'package:flutter/material.dart';

class DisplayAliveScreen extends StatefulWidget {
  final int? count;
  final String? image;
  

  final String? name;
  final String? species;
  final String? location;
  const DisplayAliveScreen(
      {Key? key, this.count, this.name, this.species, this.location, this.image})
      : super(key: key);

  @override
  State<DisplayAliveScreen> createState() => _DisplayAliveScreenState();
}

class _DisplayAliveScreenState extends State<DisplayAliveScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Alive Data Display Screen"),
      ),
      body: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: Colors.pink,
            child: Image.network(
              "${widget.count}",
            ),
          ),
        ),
        title: Text(
          "Count ${widget.name}",
        ),
        subtitle: Text(
          "Name ${widget.name}}",
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [Text(""), Text("")],
        ),
      ),
    );
  }

  static Helper() {}
}
