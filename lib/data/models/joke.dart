class Joke {
  final String id;
  final String status;
  final String content;
  final int jokeNo;
  final String createdBy;

  Joke({required this.id, required this.status, required this.content, required this.jokeNo, required this.createdBy});

  factory Joke.fromJson(Map<String, dynamic> json) {
    return Joke(
      id: json['_id'],
      status: json['status'],
      content: json['jokeContent'],
      jokeNo: json['jokeNo'],
      createdBy: json['created_by'],
    );
  }
}
