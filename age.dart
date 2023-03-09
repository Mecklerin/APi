class ages{
  late int age,count;
  late String name;

  ages({
   required this.age,
   required this.count,
   required this.name
});
  factory ages.forMap(Map<String, dynamic> e) {
    return ages(
        name: e["key"].toString(),
        age:int.parse(e['age'].toString()),
        count:int.parse(e['count'].toString())
    );
  }
}