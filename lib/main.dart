import "package:flutter/material.dart";
import './quiz.dart';
import './result.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const _data = [
    {
      'questionText': 'Malenia - ',
      'answers': [
        {'text': 'blade of miquella', 'score': 1.00},
        {'text': 'wraith of bacolenia', 'score': 0.00},
        {'text': 'maid of pandarenia', 'score': 0.00},
        {'text': 'glave of tarantelia', 'score': 0.00},
      ]
    },
    {
      'questionText': 'корневой мост - ',
      'answers': [
        {'text': 'мостовой корень', 'score': 0.00},
        {'text': 'нативный порт ', 'score': 0.00},
        {'text': 'usb модем', 'score': 0.00},
        {'text': 'корневой порт', 'score': 1.00},
      ]
    },
    {
      'questionText': 'Never gonna - ',
      'answers': [
        {'text': 'give you up', 'score': 1.00},
        {'text': 'let you down', 'score': 1.00},
        {'text': 'run around', 'score': 1.00},
        {'text': 'make you cry', 'score': 1.00}
      ]
    },
    {
      'questionText': 'Лучший год -',
      'answers': [
        {'text': '2000', 'score': 0.00},
        {'text': '2012', 'score': 0.00},
        {'text': '2007', 'score': 1.00},
        {'text': '2015', 'score': 0.00}
      ]
    },
    {
      'questionText': 'Это там белочка что ли,',
      'answers': [
        {'text': 'Да', 'score': 0.00},
        {'text': 'Нет', 'score': 0.00},
        {'text': 'Двигай давай', 'score': 1.00},
        {'text': 'А кто спрашивает', 'score': 0.00}
      ]
    }
  ];

  var _indexQuestion = 0;
  double _totalScore = 0.00;

  void _answerQuestion(double score) {
    _totalScore += score;

    setState(() {
      _indexQuestion += 1;
    });
  }

  void _restart() {
    setState(() {
      _indexQuestion = 0;
      _totalScore = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color.fromARGB(255, 102, 173, 175),
          appBar: AppBar(
            title: Align(
              alignment: Alignment.center,
              child: Text(
                "Flutter Quiz App",
                style: TextStyle(
                  color: Color.fromARGB(255, 192, 189, 189),
                ),
              ),
            ),
            backgroundColor: Colors.teal,
          ),
          body: Align(
              alignment: Alignment.center,
              child: (_indexQuestion <= 4 && _indexQuestion >= 0)
                  ? Quiz(
                      answerQuestion: _answerQuestion,
                      indexQuestion: _indexQuestion,
                      data: _data)
                  : Result(_totalScore, _restart))),
    );
  }
}
