import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:flutter/material.dart';
import 'package:quiz_task/api/api_handler.dart';
import 'package:quiz_task/api/model/quiz_model.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    getQuiz();
  }

  PageController pageController = PageController();
  int currentIndex = 0;
  List<String> rightQuestionAns = [];
  List<QuizModel> quizList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueGrey.shade800,
        ),
        backgroundColor: Colors.blueGrey.shade800,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              mainAxisSize: MainAxisSize.max,
              children: [
                //Text("${rightQuestionAns.length} / ${quizList.length}"),
                Text(
                  "Question : ${currentIndex + 1}/${quizList!.length}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                Text(
                  "Score:${rightQuestionAns.length}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            quizList.isNotEmpty
                ? SingleChildScrollView(
                    child: ExpandablePageView.builder(
                        controller: pageController,
                        onPageChanged: (val) {
                          setState(() {
                            currentIndex = val;
                          });
                        },
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: quizList.length, //12
                        itemBuilder: (context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                ListTile(
                                  title: Text(quizList[index].question ?? ""),
                                ),
                                RadioListTile(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.grey)),
                                    activeColor: quizList[index].correctAnswers!.answerACorrect!.toLowerCase() == "true" ? Colors.green : Colors.red,
                                    title: Text(
                                      quizList[index].answers!.answerA.toString(),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    value: quizList[index].answers!.answerA ?? "",
                                    groupValue: quizList[index].selectedAns,
                                    onChanged: (value) {
                                      if (quizList[index].selectedAns?.toLowerCase() == null) {
                                        if (quizList[index].correctAnswers!.answerACorrect!.toLowerCase() == "true") {
                                          if (!(rightQuestionAns.contains(quizList[index].correctAnswers!.answerBCorrect!))) {
                                            rightQuestionAns.add(value!);
                                          }
                                        }
                                        quizList[index].selectedAns = value!;
                                        pageController.animateToPage(currentIndex + 1, duration: Duration(seconds: 2), curve: Curves.easeInOutQuad);
                                        setState(() {});
                                      }
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                RadioListTile(
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.grey)),
                                    activeColor: quizList[index].correctAnswers!.answerBCorrect!.toLowerCase() == "true" ? Colors.green : Colors.red,
                                    title: Text(
                                      quizList[index].answers!.answerB.toString(),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    value: quizList[index].answers!.answerB ?? "",
                                    groupValue: quizList[index].selectedAns,
                                    onChanged: (value) {
                                      if (quizList[index].selectedAns?.toLowerCase() == null) {
                                        if (quizList[index].correctAnswers!.answerBCorrect!.toLowerCase() == "true") {
                                          if (!(rightQuestionAns.contains(quizList[index].correctAnswers!.answerBCorrect!))) {
                                            rightQuestionAns.add(value!);
                                          }
                                        }
                                        quizList[index].selectedAns = value!;
                                        pageController.animateToPage(currentIndex + 1, duration: Duration(seconds: 2), curve: Curves.easeInOutQuad);
                                        setState(() {});
                                      }
                                    }),
                                SizedBox(
                                  height: 10,
                                ),
                                quizList[index].answers!.answerC != null
                                    ? RadioListTile(
                                        shape:
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.grey)),
                                        activeColor:
                                            quizList[index].correctAnswers!.answerCCorrect!.toLowerCase() == "true" ? Colors.green : Colors.red,
                                        title: Text(
                                          quizList[index].answers!.answerC.toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: quizList[index].answers?.answerC,
                                        groupValue: quizList[index].selectedAns,
                                        onChanged: (value) {
                                          if (quizList[index].selectedAns?.toLowerCase() == null) {
                                            if (quizList[index].correctAnswers!.answerCCorrect!.toLowerCase() == "true") {
                                              if (!(rightQuestionAns.contains(quizList[index].correctAnswers!.answerCCorrect!))) {
                                                rightQuestionAns.add(value!);
                                              }
                                            }
                                            quizList[index].selectedAns = value!;
                                            pageController.animateToPage(currentIndex + 1,
                                                duration: Duration(seconds: 2), curve: Curves.easeInOutQuad);

                                            setState(() {});
                                          }
                                        })
                                    : SizedBox(),
                                SizedBox(
                                  height: 10,
                                ),
                                quizList[index].answers!.answerD != null
                                    ? RadioListTile(
                                        shape:
                                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0), side: BorderSide(color: Colors.grey)),
                                        activeColor:
                                            quizList[index].correctAnswers!.answerDCorrect!.toLowerCase() == "true" ? Colors.green : Colors.red,
                                        title: Text(
                                          quizList[index].answers!.answerD.toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: quizList[index].answers?.answerD,
                                        groupValue: quizList[index].selectedAns,
                                        onChanged: (value) {
                                          if (quizList[index].selectedAns?.toLowerCase() == null) {
                                            if (quizList[index].correctAnswers!.answerDCorrect!.toLowerCase() == "true") {
                                              if (!(rightQuestionAns.contains(quizList[index].correctAnswers!.answerDCorrect))) {
                                                rightQuestionAns.add(value!);
                                              }
                                            }

                                            quizList[index].selectedAns = value!;
                                            pageController.animateToPage(currentIndex + 1,
                                                duration: Duration(seconds: 2), curve: Curves.easeInOutQuad);

                                            setState(() {});
                                          }
                                        })
                                    : SizedBox(),
                                SizedBox(
                                  height: 10,
                                ),
                                quizList[index].answers!.answerE != null
                                    ? RadioListTile(
                                        activeColor:
                                            quizList[index].correctAnswers!.answerECorrect!.toLowerCase() == "true" ? Colors.green : Colors.red,
                                        title: Text(
                                          quizList[index].answers!.answerE.toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: quizList[index].answers?.answerE,
                                        groupValue: quizList[index].selectedAns,
                                        onChanged: (value) {
                                          if (quizList[index].selectedAns?.toLowerCase() == null) {
                                            if (quizList[index].correctAnswers!.answerECorrect!.toLowerCase() == "true") {
                                              if (!(rightQuestionAns.contains(quizList[index].correctAnswers!.answerECorrect))) {
                                                rightQuestionAns.add(value!);
                                              }
                                            }
                                            quizList[index].selectedAns = value!;
                                            pageController.animateToPage(currentIndex + 1,
                                                duration: Duration(seconds: 2), curve: Curves.easeInOutQuad);

                                            setState(() {});
                                          }
                                        })
                                    : SizedBox(),
                                quizList[index].answers!.answerF != null
                                    ? RadioListTile(
                                        activeColor:
                                            quizList[index].correctAnswers!.answerFCorrect!.toLowerCase() == "true" ? Colors.green : Colors.red,
                                        title: Text(
                                          quizList[index].answers!.answerF.toString(),
                                          style: TextStyle(fontSize: 16),
                                        ),
                                        value: quizList[index].answers?.answerF,
                                        groupValue: quizList[index].selectedAns,
                                        onChanged: (value) {
                                          if (quizList[index].selectedAns?.toLowerCase() == null) {
                                            if (quizList[index].correctAnswers!.answerFCorrect!.toLowerCase() == "true") {
                                              if (!(rightQuestionAns.contains(quizList[index].correctAnswers!.answerFCorrect))) {
                                                rightQuestionAns.add(value!);
                                              }
                                            }
                                            quizList[index].selectedAns = value!;
                                            pageController.animateToPage(currentIndex + 1,
                                                duration: Duration(seconds: 2), curve: Curves.easeInOutQuad);

                                            setState(() {});
                                          }
                                        })
                                    : SizedBox(),
                              ]),
                            ),
                          );
                        }),
                  )
                : Center(child: CircularProgressIndicator())
          ],
        ));
  }

  void getQuiz() {
    ApiService().getQuiz().then((value) => {
          setState(() {
            quizList = value;
          }),
        });
  }
}
