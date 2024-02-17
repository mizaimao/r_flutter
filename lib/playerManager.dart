import 'dart:math';
import 'dart:async';

import 'singlePlayer.dart';
import 'files.dart';

class PlayerManager {
  int maxNumberPlayer = -1;
  int currentPlayerIndex = 0;
  Random rng = Random();
  final List<String> allFragmentsList = allFragments.keys.toList();

  // Player for each page
  final sPlayerRandomizer = SinglePlayer();
  final sPlayerSequencer = SinglePlayer();
  final sPlayerFragement = SinglePlayer();
  final sPlayerTreasure = SinglePlayer();
  final sPlayerFuture = SinglePlayer();
  final sequencePlayer = SequencePlayer();
  List<Timer> timerList = [];

  // MultiPlayer array
  List<ComposePlayer> players = [];

  // Constructor
  PlayerManager(this.maxNumberPlayer) {
    assert(maxNumberPlayer > 0);
    for (int i = 0; i < maxNumberPlayer; i++) {
      players.add(ComposePlayer());
    }
  }

  List<double> getSchedule(int length, String seed) {
    return <double>[];
  }

  void stopComposed() {
    for (int i = 0; i < maxNumberPlayer; i++) {
      players[i].stopPlay();
    }

    for (Timer _timer in timerList) {
      _timer.cancel();
    }
  }

  List<double> getRandomTimes(int number, double low, double high) {
    assert(number > 0);
    List<double> timePoints = [
      0.0
    ]; // Make the first element 0 to start playing immediately.
    double prev = 0.0;
    double current = 0.0;
    for (int i = 1; i < number; i++) {
      current = low + rng.nextDouble() * (high - low) + prev;
      timePoints.add(current);
      prev = current;
    }
    return timePoints;
  }

  List<int> getRandomSequenceIndex(int number) {
    return <int>[
      for (int i = 0; i < number; i++) rng.nextInt(allFragments.length)
    ];
  }

  void playComposed(int chaosLevel, int repeats, {String fragName = ''}) {
    stopComposed();

    double low = 0.0;
    double high = 0.0;

    if (fragName == "so" || fragName == "R") {
      low = chaosShort[chaosLevel]!.first;
      high = chaosShort[chaosLevel]!.last;
    } else {
      low = chaosLong[chaosLevel]!.first;
      high = chaosLong[chaosLevel]!.last;
    }

    List<int> randomFragIndices = getRandomSequenceIndex(repeats);
    List<double> timePoints = getRandomTimes(repeats, low, high);

    timerList.clear();
    for (int i = 0; i < repeats; i++) {
      timerList.add(
          Timer(Duration(milliseconds: (timePoints[i] * 1000).round()), () {
        String soundName = fragName.isEmpty
            ? allFragmentsList[randomFragIndices[i]]
            : fragName;
        players[i % maxNumberPlayer].playSound(soundName);
      }));
    }
  }
}
