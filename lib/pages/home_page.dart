import 'package:flutter/material.dart';
import 'package:quiz_task/api/api_handler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var textEditiingController1 = TextEditingController();
  var textEditiingController2 = TextEditingController();

  var textEditiingController3 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            TextFormField(
              controller: textEditiingController1,
              decoration: InputDecoration(hintText: "Enter First elemenent "),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: textEditiingController2,
              decoration: InputDecoration(hintText: "Enter Second  elemenent "),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: textEditiingController3,
              decoration: InputDecoration(hintText: "Enter third  elemenent "),
            ),
            ElevatedButton(
                onPressed: () {
                  ApiService().postMethodDemo(
                      {"userId": textEditiingController3.text, "id": textEditiingController1.text, "title": textEditiingController2.text});
                },
                child: Text("Send Post Request"))
          ],
        ),
      ),
    );
  }
}
