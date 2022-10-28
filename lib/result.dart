import 'package:flutter/material.dart';
import './question.dart';

class Result extends StatelessWidget {
  final double resultScore;
  final VoidCallback resetHandler;

  const Result(this.resultScore, this.resetHandler, {Key? key})
      : super(key: key);

  String get resultPhrase {
    String resultText;
    final score = num.parse(resultScore.toStringAsFixed(2));
    if (score == 5.00) {
      resultText = 'Ты набрал целых $score очков, красава';
    } else if (score > 1.00 && score <= 4.00) {
      resultText = 'Ты набрал целых $score очка, красава';
    } else {
      resultText = 'Ты набрал целое $score очко, красава';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(540.0)),
                    child: Image.asset("assets/dyain.png",
                        height: 240, width: 540, fit: BoxFit.fill)),
                Padding(
                    padding: const EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      width: 360,
                      child: Question(
                        resultPhrase,
                      ),
                    )),
                ElevatedButton(
                  child: SizedBox(
                    width: 200,
                    child: Text(
                      'Try again',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          Color.fromARGB(255, 21, 104, 116))),
                  onPressed: resetHandler,
                )
              ],
            )));
  }
}
