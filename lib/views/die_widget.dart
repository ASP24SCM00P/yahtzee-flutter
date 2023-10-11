import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';

class DieWidget extends StatefulWidget {
  final int? value;
  final bool isHeld;
  final VoidCallback onTap;
  final Dice dice;
  final int index;

  DieWidget({
    required this.value,
    required this.isHeld,
    required this.onTap,
    required this.dice,
    required this.index,
  });
  @override
  _DieWidgetState createState() => _DieWidgetState();
}

class _DieWidgetState extends State<DieWidget> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isTapped = !isTapped;
        });
        widget.onTap();
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: () {
            final isHeld = widget.dice.isHeld(widget.index);
            if (isHeld) {
              return Colors.blue;
            } else {
              return Colors.white;
            }
          }(),
          border: Border.all(
            color: Colors.black,
            width: 2.0,
          ),
        ),
        alignment: Alignment.center,
        child: Text(
          widget.value != null ? widget.value.toString() : '',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
