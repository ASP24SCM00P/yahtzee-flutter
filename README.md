# 🎲 Yahtzee - A Modern Flutter Implementation

## 🚀 Overview

**Yahtzee** is a single-player dice game built with **Flutter**, designed to provide a seamless and interactive gaming experience. The objective is to roll five dice and strategically choose scoring categories to maximize your score.

This project showcases **state management techniques, responsive UI design, and Flutter animations** while implementing the core mechanics of the classic [Yahtzee](https://en.wikipedia.org/wiki/Yahtzee) game.

🔹 **Tech Stack:** Flutter, Dart  
🔹 **Features:** Stateful widgets, score calculations, dice animations  
🔹 **Status:** 🚧 In Progress / ✅ Complete  

---

## 🎯 Features

✅ **Fully Functional Dice Rolling Mechanism**  
✅ **Hold & Release Dice Strategy**  
✅ **Scoring System Based on Yahtzee Rules**  
✅ **Dynamic Scorecard with Category Selection**  
✅ **Game Reset & Replay Support**  
✅ **Responsive UI (Optimized for Desktop & Web)**  

---

## 🛠️ Installation

### **Prerequisites**
- Install [Flutter](https://flutter.dev/docs/get-started/install)
- Ensure you have Dart installed (`dart --version`)

### **Steps to Run Locally**
```bash
git clone https://github.com/your-username/yahtzee-flutter.git
cd yahtzee-flutter
flutter pub get
flutter run

### `Dice`, `ScoreCategory`, and `Scorecard` classes

Because the focus of this machine problem is to practice using stateful widgets, we've provided you with classes that represent the dice, score categories, and scorecard. These classes are defined in the `lib/models/dice.dart` and `lib/models/scorecard.dart` files.

The `Dice` class represents some fixed number of 6-sided dice, each of which may be "held" or "unheld", which affects whether it is randomly updated when `roll` is called. Here's an example of how you might use the `Dice` class:

```dart
final dice = Dice(5); // all 5 dice are initially unheld and null

dice.roll();
print(dice.values);

dice.toggleHold(0); // hold the first die
dice.toggleHold(3); // hold the fourth die

dice.roll();
print(dice.values);

dice.clear(); // clear and unhold all dice values
dice.roll();
print(dice.values);

print(dice[0]);
print(dice.isHeld(0));
```

Sample output for the code above follows:

```
[5, 6, 5, 4, 3]
[5, 4, 6, 4, 1]
[2, 3, 1, 2, 3]

2

false
```

`ScoreCategory` is an enumeration of the 13 possible scoring categories in Yahtzee.

`Scorecard` represents the scorecard used in Yahtzee. It maps `ScoreCategory` values to nullable `int` values to represent the score for a given category (or `null` if the category has not yet been used).

Here's an example of how you might use the three provided classes together:

```dart
final scoreCard = ScoreCard();

scoreCard.registerScore(ScoreCategory.threeOfAKind, 
                        <int>[4, 4, 2, 4, 5]);
print(scoreCard[ScoreCategory.threeOfAKind]);

final dice = Dice(5);
dice.roll();
print(dice.values);

scoreCard.registerScore(ScoreCategory.chance, dice.values);
print(scoreCard[ScoreCategory.chance]);

for (final cat in ScoreCategory.values) {
  print('${cat.name}: ${scoreCard[cat]}');
}

print('All categories used? ${scoreCard.completed}');
print('Total score = ${scoreCard.total}');

scoreCard.clear();
print(scoreCard[ScoreCategory.chance]);
```

Sample output for the code above follows:

```
19

[3, 5, 2, 6, 6]

22

Ones: null
Twos: null
Threes: null
Fours: null
Fives: null
Sixes: null
Three of a Kind: 19
Four of a Kind: null
Full House: null
Small Straight: null
Large Straight: null
Yahtzee: null
Chance: 22

All categories used? false
Total score = 41

null
```




