// To parse this JSON data, do
//
//     final quizModel = quizModelFromJson(jsonString);

import 'dart:convert';

List<QuizModel> quizModelFromJson(String str) => List<QuizModel>.from(json.decode(str).map((x) => QuizModel.fromJson(x)));

String quizModelToJson(List<QuizModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuizModel {
  int? id;
  String? question;
  String? description;
  Answers? answers;
  String? multipleCorrectAnswers;
  CorrectAnswers? correctAnswers;
  String? explanation;
  dynamic tip;
  List<dynamic>? tags;
  String? category;
  String? difficulty;
  String? selectedAns;

  QuizModel({
    this.id,
    this.question,
    this.description,
    this.answers,
    this.multipleCorrectAnswers,
    this.correctAnswers,
    this.explanation,
    this.tip,
    this.tags,
    this.category,
    this.difficulty,
    this.selectedAns,
  });

  QuizModel copyWith({
    int? id,
    String? question,
    String? description,
    Answers? answers,
    String? multipleCorrectAnswers,
    CorrectAnswers? correctAnswers,
    String? explanation,
    dynamic tip,
    List<dynamic>? tags,
    String? category,
    String? difficulty,
    List<String>? checkBoxValue,
    String? selectedAns,
    bool? selectedBool,
  }) =>
      QuizModel(
        id: id ?? this.id,
        question: question ?? this.question,
        description: description ?? this.description,
        answers: answers ?? this.answers,
        multipleCorrectAnswers: multipleCorrectAnswers ?? this.multipleCorrectAnswers,
        correctAnswers: correctAnswers ?? this.correctAnswers,
        explanation: explanation ?? this.explanation,
        tip: tip ?? this.tip,
        tags: tags ?? this.tags,
        category: category ?? this.category,
        difficulty: difficulty ?? this.difficulty,
        selectedAns: selectedAns ?? this.selectedAns,
      );

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        question: json["question"],
        description: json["description"],
        answers: json["answers"] == null ? null : Answers.fromJson(json["answers"]),
        multipleCorrectAnswers: json["multiple_correct_answers"],
        correctAnswers: json["correct_answers"] == null ? null : CorrectAnswers.fromJson(json["correct_answers"]),
        explanation: json["explanation"],
        tip: json["tip"],
        tags: json["tags"] == null ? [] : List<dynamic>.from(json["tags"]!.map((x) => x)),
        category: json["category"],
        difficulty: json["difficulty"],
        selectedAns: json["selectedAns"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "question": question,
        "description": description,
        "answers": answers?.toJson(),
        "multiple_correct_answers": multipleCorrectAnswers,
        "correct_answers": correctAnswers?.toJson(),
        "explanation": explanation,
        "tip": tip,
        "tags": tags == null ? [] : List<dynamic>.from(tags!.map((x) => x)),
        "category": category,
        "difficulty": difficulty,
        "selectedAns": selectedAns,
      };
}

class Answers {
  String? answerA;
  String? answerB;
  String? answerC;
  String? answerD;
  dynamic answerE;
  dynamic answerF;

  Answers({
    this.answerA,
    this.answerB,
    this.answerC,
    this.answerD,
    this.answerE,
    this.answerF,
  });

  Answers copyWith({
    String? answerA,
    String? answerB,
    String? answerC,
    String? answerD,
    dynamic answerE,
    dynamic answerF,
  }) =>
      Answers(
        answerA: answerA ?? this.answerA,
        answerB: answerB ?? this.answerB,
        answerC: answerC ?? this.answerC,
        answerD: answerD ?? this.answerD,
        answerE: answerE ?? this.answerE,
        answerF: answerF ?? this.answerF,
      );

  factory Answers.fromJson(Map<String, dynamic> json) => Answers(
        answerA: json["answer_a"],
        answerB: json["answer_b"],
        answerC: json["answer_c"],
        answerD: json["answer_d"],
        answerE: json["answer_e"],
        answerF: json["answer_f"],
      );

  Map<String, dynamic> toJson() => {
        "answer_a": answerA,
        "answer_b": answerB,
        "answer_c": answerC,
        "answer_d": answerD,
        "answer_e": answerE,
        "answer_f": answerF,
      };
}

class CorrectAnswers {
  String? answerACorrect;
  String? answerBCorrect;
  String? answerCCorrect;
  String? answerDCorrect;
  String? answerECorrect;
  String? answerFCorrect;

  CorrectAnswers({
    this.answerACorrect,
    this.answerBCorrect,
    this.answerCCorrect,
    this.answerDCorrect,
    this.answerECorrect,
    this.answerFCorrect,
  });

  CorrectAnswers copyWith({
    String? answerACorrect,
    String? answerBCorrect,
    String? answerCCorrect,
    String? answerDCorrect,
    String? answerECorrect,
    String? answerFCorrect,
  }) =>
      CorrectAnswers(
        answerACorrect: answerACorrect ?? this.answerACorrect,
        answerBCorrect: answerBCorrect ?? this.answerBCorrect,
        answerCCorrect: answerCCorrect ?? this.answerCCorrect,
        answerDCorrect: answerDCorrect ?? this.answerDCorrect,
        answerECorrect: answerECorrect ?? this.answerECorrect,
        answerFCorrect: answerFCorrect ?? this.answerFCorrect,
      );

  factory CorrectAnswers.fromJson(Map<String, dynamic> json) => CorrectAnswers(
        answerACorrect: json["answer_a_correct"],
        answerBCorrect: json["answer_b_correct"],
        answerCCorrect: json["answer_c_correct"],
        answerDCorrect: json["answer_d_correct"],
        answerECorrect: json["answer_e_correct"],
        answerFCorrect: json["answer_f_correct"],
      );

  Map<String, dynamic> toJson() => {
        "answer_a_correct": answerACorrect,
        "answer_b_correct": answerBCorrect,
        "answer_c_correct": answerCCorrect,
        "answer_d_correct": answerDCorrect,
        "answer_e_correct": answerECorrect,
        "answer_f_correct": answerFCorrect,
      };
}
