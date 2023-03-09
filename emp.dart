import 'package:flutter/material.dart';

class music {
  late String wrapperType ,kind,artistName;


  music({
    required this.wrapperType,
    required this.kind,
    required this.artistName
});
  factory music.forMap(Map<String, dynamic>e){
    return music(wrapperType: e['wrapperType'].toString(), kind: e['kind'].toString(), artistName: e["artistName"].toString());
  }
}

// class emp
// {
//   late int userId,id;
//   late String title;
//
//   emp(this.userId,this.id,this.title);
//
//   emp.fromMap(Map<String,dynamic> e)
//   {
//     userId = e["userId"];
//     id = e["id"];
//     title = e["title"];
//   }
// }