// Class used to share objects across widgets.
import 'package:flutter/material.dart';

import 'playerManager.dart';

class AppData {
  PlayerManager pm = PlayerManager(20);

  // Randomizer settings
  double chaosLevel = 0;
  double repeatLevel = 0;
  int poisonIndex = 0;

  // Sequencer settings

  // Fragment settings
  bool brainWashToggle = false;
  double playSpeed = 1.0;
  int colCount = 2;

  // Future page settings
  bool enableButton = false;
  Color rButtonColor = Colors.black;

  void updateChaosRepeats(double chaosLevel, double repeatLevel) {
    // TODO: implement updateChaosRepeats
  }
}
