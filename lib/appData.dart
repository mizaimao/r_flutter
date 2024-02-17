// Class used to share objects across widgets.
import 'package:flutter/material.dart';

import 'playerManager.dart';

class AppData {
  // Version info.
  String versionInfo = "unknown";

  // arg is how many player instances to create.
  PlayerManager pm = PlayerManager(50);

  // Randomizer settings.
  double chaosLevel = 0;
  double repeatLevel = 0;
  int poisonIndex = 0;

  // Sequencer settings.

  // Fragment settings.
  bool brainWashToggle = false;
  double playSpeed = 1.0;
  int colCount = 2;

  // Treasure settings.

  // Future page settings.
  bool enableButton = false;
  Color rButtonColor = Colors.black;
}
