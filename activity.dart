class activities {
  late String activity, type, key;
  late int participants;

  activities({
    required this.activity,
    required this.type,
    required this.key,
    required this.participants,
  });

  factory activities.forMap(Map<String, dynamic> e) {
    return activities(
        activity: e['activity'].toString(),
        type: e['type'].toString(),
        key: e["key"].toString(),
        participants:int.parse(e['participants'].toString())
    );
  }
}
