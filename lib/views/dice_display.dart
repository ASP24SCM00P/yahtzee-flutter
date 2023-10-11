import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';
import 'package:mp2/models/scorecard.dart';
import 'package:mp2/views/die_widget.dart';

class DiceDisplay extends StatefulWidget {
  final List<int> diceValues;
  final VoidCallback rollDice;
  final int rollsLeft;
  final List<bool> diceHeld;
  final int currentRound;
  final Map<ScoreCategory, int> rounds;
  final Dice dice;

  DiceDisplay({
    required this.diceValues,
    required this.rollDice,
    required this.rollsLeft,
    required this.diceHeld,
    required this.currentRound,
    required this.rounds,
    required this.dice,
  });

  @override
  _DiceDisplayState createState() => _DiceDisplayState();
}

class _DiceDisplayState extends State<DiceDisplay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (int i = 0; i < 5; i++)
              DieWidget(
                value:
                    i < widget.diceValues.length ? widget.diceValues[i] : null,
                index: i,
                isHeld:
                    i < widget.diceValues.length ? widget.diceHeld[i] : false,
                dice: widget.dice,
                onTap: () {
                  if (i < widget.diceValues.length &&
                      widget.diceValues[i] != null) {
                    widget.dice.toggleHold(i);
                  }
                },
              ),
          ],
        ),
        ElevatedButton(
          onPressed: (widget.rollsLeft > 0 || widget.diceHeld.contains(true)) &&
                  widget.rounds.containsValue(-1)
              ? widget.rollDice
              : null,
          child: Text(
            widget.rollsLeft > 0
                ? 'Roll (${widget.rollsLeft})'
                : 'No more Rolls!',
          ),
        ),
      ],
    );
  }
}
