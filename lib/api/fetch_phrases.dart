import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:language_gym_english/constants.dart' as constants;

Future<List> fetchPhrases() async {
  final response = await http.get(Uri.parse(constants.phrasesUrl));

  if (response.statusCode != 200) {
    return throw Exception('Failed to load phrases');
  }

  return jsonDecode(response.body);
}
