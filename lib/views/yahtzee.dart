
import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';
import 'package:mp2/models/scorecard.dart';
import 'package:mp2/views/dice_display.dart';
import 'package:mp2/views/scorecard_display.dart';


class Yahtzee extends StatefulWidget {
  const Yahtzee({Key? key}) : super(key: key);

  @override
  _YahtzeeState createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  final Dice dice = Dice(5);
  int _currentRound = 1;
  int _rollsLeft = 3;
  bool _categoryPicked = false;

  List<bool> _diceHeld = [false, false, false, false, false];

  Map<ScoreCategory, int> _rounds = {
    ScoreCategory.ones: -1,
    ScoreCategory.twos: -1,
    ScoreCategory.threes: -1,
    ScoreCategory.fours: -1,
    ScoreCategory.fives: -1,
    ScoreCategory.sixes: -1,
    ScoreCategory.threeOfAKind: -1,
    ScoreCategory.fourOfAKind: -1,
    ScoreCategory.smallStraight: -1,
    ScoreCategory.largeStraight: -1,
    ScoreCategory.chance: -1,
    ScoreCategory.fullHouse: -1,
    ScoreCategory.yahtzee: -1,
  };

  int get rollsLeft => _rollsLeft;
  ScoreCard scoreCard = ScoreCard();

  void _initializeGame() {
    _currentRound = 1;
    _rollsLeft = 3;
    _diceHeld = [false, false, false, false, false];
    _rounds = {
      for (var category in ScoreCategory.values) category: -1,
    };
    scoreCard.clear();
    dice.clear();
    dice.clearColor();
  }

  void _resetGame() {
    setState(() {
      _initializeGame();
    });
  }

  void rollDice() {
    if (rollsLeft > 0) {
      setState(() {
        final List<int?> originalValues = List.from(dice.values);
        dice.roll();
        for (int i = 0; i < 5; i++) {
         
          if (_diceHeld[i]) {
            dice.values[i] = originalValues[i] ?? 0;
          }
        }
        _rollsLeft--;

        if (rollsLeft == 0) {
        }
      });
    }
  }

  void startNewRound() {
    setState(() {
      if (_currentRound < 13) {
        _currentRound++;
        _rollsLeft = 3;
        _diceHeld = [false, false, false, false, false];
        _categoryPicked = false;
          dice.clearColor();
      
      } else {
        final totalScore = scoreCard.total;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Game Over'),
              content: Text('Your score is $totalScore'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    _resetGame();
                  },
                  child: Text('Play Again'),
                ),
              ],
            );
          },
        );
      }
    });
  }

  void onCategorySelected(ScoreCategory category) {
    if (!_categoryPicked && _rounds[category] == -1) {
      setState(() {
        _categoryPicked = true;
        _rounds[category] = _currentRound;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final diceValues = dice.values; 

    return Column(
      children: [
        DiceDisplay(
          diceValues: diceValues,
          rollDice: rollDice,
          rollsLeft: rollsLeft,
          diceHeld: _diceHeld,
          currentRound: _currentRound,
          rounds: _rounds,
          dice: dice,
        ),
        ScorecardDisplay(
          diceValues: diceValues,
          onUpdate: () {
            setState(() {}); 
          },
          currentRound: _currentRound,
          startNewRound: startNewRound,
          rounds: _rounds,
          onCategorySelected: onCategorySelected,
          scoreCard: scoreCard,
        ),
        TotalScoreDisplay(
          scoreCard: scoreCard,
        ),
      ],
    );
  }
}

class TotalScoreDisplay extends StatelessWidget {
  final ScoreCard scoreCard;

  TotalScoreDisplay({required this.scoreCard});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(14.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Current Score',
            style: TextStyle(
              fontSize: 9.0,
              fontWeight: FontWeight.bold,
            ),
          ),
         // SizedBox(height: 8.0),
          Text(
            '${scoreCard.total}',
            style: TextStyle(
              fontSize: 24.0,
              color: Colors.blue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

