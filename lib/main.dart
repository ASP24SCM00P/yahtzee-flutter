import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mp2/custom_app_bar.dart';
import 'package:mp2/views/yahtzee.dart';

void main() {
  runApp(MaterialApp(
    title: 'Yahtzee Game',
    home: Scaffold(
      appBar: CustomAppBar(),
      body: Yahtzee(),
    ),
  ));
}
