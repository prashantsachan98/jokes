import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/data/models/joke.dart';

import '../../constants/api_key.dart';

class JokeApiProvider {
  final http.Client httpClient;
  

  JokeApiProvider(this.httpClient);

  Future<Joke> getJoke() async {
    final response = await httpClient.get(Uri.parse('https://hindi-jokes-api.onrender.com/jokes?api_key=$apiKey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return Joke.fromJson(data);
    } else {
      throw Exception('Failed to fetch joke');
    }
  }
}
