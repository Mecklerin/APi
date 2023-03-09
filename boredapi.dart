import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/activity.dart';
class boredapi extends StatefulWidget {
  const boredapi({Key? key}) : super(key: key);

  @override
  State<boredapi> createState() => _boredapiState();
}

class _boredapiState extends State<boredapi> {
  List<activities> activitiesList=[];
  @override
  void initstate() {
    super.initState();
    print('init state');
  }

  Future<List<activities>> fetchActivity() async {
    final resp = await http
        .get(Uri.parse('https://www.boredapi.com/api/activity'));
    activitiesList.add(activities.forMap(json.decode(resp.body)));
    return activitiesList;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  FutureBuilder<List<activities>>(
          future: fetchActivity(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height:100 ,
                child: ListView.builder(
                  itemCount: activitiesList.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(activitiesList[index].activity.toString()),
                        Text(activitiesList[index].key.toString()),
                        Text(activitiesList[index].type.toString()),
                        Text(activitiesList[index].participants.toString()),

                      ],
                    );
                  },
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        )

    );
  }
}
