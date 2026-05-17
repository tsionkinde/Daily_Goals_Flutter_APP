class GoalModel {
  final int? id;
  final String title;
  final String body;

  GoalModel({this.id, required this.title, required this.body});

  factory GoalModel.fromJson(Map<String, dynamic> json) {
    return GoalModel(id: json['id'], title: json['title'], body: json['body']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id, // Ensure id is included for updates
      'title': title,
      'body': body,
    };
  }
}
