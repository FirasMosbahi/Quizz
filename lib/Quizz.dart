import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import './Question.dart';

class Quizz extends StatefulWidget {
  const Quizz({Key? key}) : super(key: key);

  @override
  State<Quizz> createState() => _QuizzState();
}

class _QuizzState extends State<Quizz> {
  int questionIndex = 0 ;
  List<Icon> results = [];
  void validateResponse(bool choice){
    setState(() {
      if (questionsList[questionIndex].response == choice){
        results.add(const Icon(Icons.check , color: Colors.green,));
      }
      else{
        results.add(const Icon(Icons.close , color: Colors.red,));
      }
      if (questionIndex == questionsList.length - 1){
        Alert(
          context: context,
          type: AlertType.success,
          title: "Congratulation",
          desc: "You have completed the quizz.",
          buttons: [
            DialogButton(
              onPressed: () {
                Navigator.pop(context);
                questionIndex = 0 ;
                results = [];
              },
              width: 120,
              child: const Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            )
          ],
        ).show();
      }else{
        questionIndex++;
      }
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      body: SafeArea(child: Column(
        children: [
          Expanded(
              flex: 5,
              child: Center(
                child: Text(
                    questionsList[questionIndex].questionText ,
                    textAlign: TextAlign.center,
                    style:const TextStyle(color: Colors.white,fontSize: 50)
                ),
              ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.green,
                child: TextButton(
                  onPressed: () => validateResponse(true),
                  child: const Text("True"),
                ),
              )
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: Colors.red,
                child: TextButton(
                  onPressed: () => validateResponse(false),
                  child: const Text("false"),
                ),
              ),
          ),
          Expanded(
              child: Row(children: results,)
          ),
        ],
      )),
    );
  }
}
