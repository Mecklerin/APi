import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/emp.dart';

class employee extends StatefulWidget {
  const employee({Key? key}) : super(key: key);

  @override
  State<employee> createState() => _employeeState();
}

class _employeeState extends State<employee> {
  List<music> musicList = [];
  @override
  void initstate() {
    super.initState();
    print('init state');
  }

  Future<List<music>> fetchemp() async {
    var resp =
    await http.get(Uri.parse('https://itunes.apple.com/search?term=John'));
    print(resp.body);
    return (json.decode(resp.body) as List)
        .map((e) => music.forMap(e))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body:  FutureBuilder<List<music>>(
       future: fetchemp(),
       builder: (context, snapshot) {
         if (snapshot.hasData) {
           print(snapshot.hasData);
            List<music> musi = snapshot.data as List<music>;
           return ListView.builder(
               itemCount: musicList.length,
               itemBuilder: (context, index) {
                 return Container(
                   height: 200,
                   child: Column(
                     children: [
                       Text(musicList[index].wrapperType.toString()),
                       Text(musicList[index].kind.toString()),
                       Text(musicList[index].artistName.toString()),
                     ],
                   ),
                 );

               });
         }
         if (snapshot.hasError) {
           print(snapshot.error.toString());
           return Text('error');
         }
         return Center(
             child: Container(
                 height: 150,
                 child: CircularProgressIndicator(
                   color: Colors.red,
                 )));
       },
     )
    );
  }
}
