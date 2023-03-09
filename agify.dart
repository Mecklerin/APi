import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:api/models/age.dart';
import 'package:flutter/material.dart';
class agify extends StatefulWidget {
  const agify({Key? key}) : super(key: key);

  @override
  State<agify> createState() => _agifyState();
}

class _agifyState extends State<agify> {
  List<ages> agesList = [];

  @override
  void initstate() {
    super.initState();
    print('init state');
  }

  Future<List<ages>> fetchActivity() async {
    final resp = await http
        .get(Uri.parse('https://api.agify.io/?name=meelad'));
    agesList.add(ages.forMap(json.decode(resp.body)));
    return agesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<ages>>(
        future: fetchActivity(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Container(
              height: 100,
              child: ListView.builder(
                itemCount: agesList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Text(agesList[index].age.toString()),
                      Text(agesList[index].count.toString()),
                      Text(agesList[index].name.toString()),
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
      ),

    );
  }
}
