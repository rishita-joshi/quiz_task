import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SubmitPage extends StatefulWidget {
  const SubmitPage({super.key});

  @override
  State<SubmitPage> createState() => _SubmitPageState();
}

class _SubmitPageState extends State<SubmitPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          backgroundColor: Colors.blueGrey.shade800,
          centerTitle: true,
          title: Text(
            "Your Result",
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Icon(Icons.sports_martial_arts_rounded),
              Text(
                "Congraulations!",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Cheers to you for a job well done! No one can compare to your creativity and passion, and it's no surprise that you've become so successful",
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "10/10",
                style: TextStyle(fontSize: 30, color: Colors.white),
              )
            ],
          ),
        ));
  }
}
