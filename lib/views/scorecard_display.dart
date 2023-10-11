import 'package:flutter/material.dart';
import 'package:mp2/models/scorecard.dart';
import 'package:mp2/views/yahtzee.dart';

class ScorecardDisplay extends StatefulWidget {
  final List<int> diceValues;
  final VoidCallback onUpdate;
  final int currentRound;
  final Function() startNewRound;
  final Map<ScoreCategory, int> rounds;
  final Function(ScoreCategory) onCategorySelected;
  final ScoreCard scoreCard;

  ScorecardDisplay({
    required this.diceValues,
    required this.onUpdate,
    required this.currentRound,
    required this.startNewRound,
    required this.onCategorySelected,
    required this.rounds,
    required this.scoreCard,
  });

  @override
  _ScorecardDisplayState createState() => _ScorecardDisplayState();
}

class _ScorecardDisplayState extends State<ScorecardDisplay> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.all(5.0), 
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: ScoreCategory.values
                  .where((category) => category.index < 6)
                  .map((category) {
                final score = widget.scoreCard[category];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                 SizedBox(width: 4),
                    Text('${category.name} : '),
                    if (score == null)
                      TextButton(
                        onPressed: () {
                          widget.onUpdate();
                          widget.onCategorySelected(category);
                          widget.scoreCard
                              .registerScore(category, widget.diceValues);

                          widget.startNewRound();
                        },
                        child: Text('Pick'),
                      )
                    else
                      Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 2.0),
                            child: Text(score.toString())),
                      )
                  ],
                );
              }).toList(),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: ScoreCategory.values
                  .where((category) => category.index >= 6)
                  .map((category) {
                final score = widget.scoreCard[category];

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 8),
                    Text('${category.name} : '),
                    if (score == null)
                      SizedBox(
                        width: 80,
                        child: TextButton(
                          onPressed: () {
                            widget.onUpdate();
                            widget.onCategorySelected(category);
                            widget.scoreCard
                                .registerScore(category, widget.diceValues);
                            widget.startNewRound();
                          },
                          child: Text('Pick'),
                        ),
                      )
                    else
                      Container(
                        child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.0, vertical: 2.0),
                            child: Text(score.toString())),
                      )
                  ],
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

