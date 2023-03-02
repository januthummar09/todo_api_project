import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:todo_api_project/utils/helper.dart';

import '../../model/alive_model.dart';
import 'display_alive_screen.dart';

class AliveScreen extends StatefulWidget {
  const AliveScreen({Key? key}) : super(key: key);

  @override
  State<AliveScreen> createState() => _AliveScreenState();
}

class _AliveScreenState extends State<AliveScreen> {
  AliveModel? aliveModel;

  @override
  void initState() {
    super.initState();
    debugPrint("statement------>>");
    getAliveData();
    debugPrint("statement end------>>");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: aliveModel == null
          ? const SizedBox()
          : ListView.separated(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 5,
                  ),
                  child: Card(
                    color: Colors.blue,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 15,
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DisplayAliveScreen(
                                count: aliveModel!.info!.count,
                                image: aliveModel!.results![index].image,
                              ),
                            ),
                          );
                        },
                        child: ListTile(
                          leading: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Container(
                              color: Colors.pink,
                              child: Image.network(
                                "${aliveModel!.results![index].image}",
                              ),
                            ),
                          ),
                          title: Text(
                            "Count ${aliveModel!.info!.count.toString()}",
                            style: Helper.textDeco(),
                          ),
                          subtitle: Text(
                            "Name ${aliveModel!.results![index].name}",
                            style: Helper.textDeco(),
                          ),
                          trailing: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                " ${aliveModel!.results![index].species}",
                                style: Helper.textDeco(),
                              ),
                              Text(
                                " ${aliveModel!.results![index].location!.name}",
                                style: Helper.textDeco(),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: aliveModel!.results!.length),
    );
  }

  getAliveData() async {
    http.Client client = http.Client();
    try {
      Response response = await client.get(Uri.parse(
          "https://rickandmortyapi.com/api/character/?name=rick&status=alive"));
      if (response.statusCode == 200) {
        debugPrint("Status code    ----------->>${response.statusCode}");
        aliveModel = AliveModel.fromJson(jsonDecode(response.body));
        debugPrint("Status code    ----------->>");
        debugPrint("Status data    ----------->>${response.body}");
        setState(() {});
      } else {
        debugPrint("Status code    ----------->>${response.statusCode}");
      }
    } finally {
      client.close();
    }
  }
}
