import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:mp2/custom_app_bar.dart';
import 'package:mp2/views/yahtzee.dart';

void main() {
  runApp(MaterialApp(
    // Get the window size in physical pixels
    title: 'Yahtzee Game',
    home: Scaffold(
      appBar: CustomAppBar(), // Add the CustomAppBar here
      body: Yahtzee(),
    ),
  ));
  
}
