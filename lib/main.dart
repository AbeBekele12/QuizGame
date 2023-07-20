import 'package:flutter/material.dart';
import 'Brain.dart';

Brain brain = Brain();


void main() => runApp(const Quiz2());

class Quiz2 extends StatelessWidget {
  const Quiz2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {

  List<Icon> scoreKeeper = [];
  bool isGameOver = false;
  int totalScore = 0;

  void CheckAnswer (bool UserAnswer ){
    if (isGameOver) return;
    bool CorrectAnswer =  brain.getAnswerText();

    setState((){
      if ( UserAnswer == CorrectAnswer){
        scoreKeeper.add(const Icon(Icons.check, color: Colors.green,));
        totalScore++;
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(

              title: const Text('Question'),

              content: Column(
                children: [
                  SizedBox(
                    height: 150, // Adjust the height as needed
                    width: 140, // Adjust the width as needed
                    child: Image.asset('assets/images.jpg'),
                  ),
                  const SizedBox(height: 15),
                  Text(brain.getHitsQuestions()),
                  TextButton(
                    child: const Text('OK'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),

                ],
              ),


            );

          },

        );
      } else {
        scoreKeeper.add(const Icon(Icons.close, color: Colors.red,));
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(

              title: const Text('Question'),

              content: Column(
            children: [
              SizedBox(
                height: 150, // Adjust the height as needed
                width: 140, // Adjust the width as needed
                child: Image.asset('assets/face.png'),
              ),
              const SizedBox(height: 15),
            Text(brain.getHitsQuestions()),
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),

            ],
            ),


            );

          },

        );

      }
      brain.NextQuestion();
      checkGameOver();
    });
  }

  void checkGameOver() {
    if (scoreKeeper.length >= 10) {
      // Set isGameOver to true when the game is over (e.g., 5 questions answered)
      isGameOver = true;
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Game Over'),
            content: Text('Your Score: $totalScore out of 10'),
            actions: <Widget>[
              TextButton(
                child: const Text('Play Again'),
                onPressed: () {
                  // Reset the game and start again
                  setState(() {
                    scoreKeeper.clear();
                    totalScore = 0;
                    isGameOver = false;
                    brain.resetQuiz();
                  });
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                brain.getQuestionsText(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green,
              ),
              onPressed: () {
                CheckAnswer(true);
              },
              child: const  Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
              onPressed: () {
                CheckAnswer(false);

              },
              child: const Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),

              ),
            ),
          ),
        ),
        Row(
          // brain.getHitsQuestions();
            children: scoreKeeper,

        )
      ],
    );
  }
}
