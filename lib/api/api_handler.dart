import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_task/api/model/demo_model.dart';
import 'package:quiz_task/api/model/quiz_model.dart';

class ApiService {
  String baseUrl = "https://jsonplaceholder.typicode.com/albums";
  final apiKey = 'JmVbV01jmIqhzc3XaXFPHRMe573j7RQFPqHkAY47';
  final limit = '12';
  final apiUrl = 'https://quizapi.io/api/v1/questions';

  Future<Demo> postMethodDemo(Map<String, dynamic> body) async {
    try {
      final response = await http.post(Uri.parse(baseUrl),
          headers: {
            'content-type': 'application/json',
          },
          body: jsonEncode(body));

      if (response.statusCode == 200 || response.statusCode == 201) {
        print(response.body.toString());

        return Demo.fromJson(jsonDecode(response.body));
      } else {
        print("error");
        throw Exception("Failed to Load");
      }
    } catch (e) {
      print("error :${e}");
      throw Exception("Failed to Load");
    }
  }

  Future<List<QuizModel>> getQuiz() async {
    List<QuizModel> quizList = [];
    final response = await http.get(
      Uri.parse('$apiUrl?apiKey=$apiKey&limit=$limit'),
    );
    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      quizList = data.map((item) => QuizModel.fromJson(item)).toList();
      return quizList;
    } else {
      throw Exception('Failed to load questions');
    }
  }
}
