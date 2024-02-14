import 'dart:math';
import 'package:audioplayers/audioplayers.dart';

import 'files.dart';

String resolveAudioPath(String fragName) {
  return "fragments/${allFragments[fragName].toString()}.mp3";
}

// Lightweight cousin of the SinglePlayer.
class ComposePlayer {
  final player = AudioPlayer();

  Future<void> playSound(String fragName) async {
    await stopPlay();
    await player.play(AssetSource(resolveAudioPath(fragName)));
  }

  Future<void> stopPlay() async {
    await player.stop();
  }
}

// Player specifically used in sequencer page.
class SequencePlayer {
  AudioPlayer sequencePlayer = AudioPlayer();

  Future<void> stopPlay() async {
    stopSequencePlayer();
  }

  void stopSequencePlayer() {
    sequencePlayer.stop();
    sequencePlayer.dispose();
    sequencePlayer = AudioPlayer();
  }

  void playSequence(List<String> playlist) async {
    print(playlist);
    stopSequencePlayer();
    sequencePlayer.play(AssetSource(resolveAudioPath(playlist[0])));
    int i = 1;
    sequencePlayer.onPlayerComplete.listen((_) {
      if (i < playlist.length) {
        sequencePlayer.play(AssetSource(resolveAudioPath(playlist[i])));
        i++;
      }
    });
  }
}

// Common single player.
class SinglePlayer {
  final player = AudioPlayer();

  final rng = Random();
  int fragmentCount = allFragments.length;
  List<String> allFragmentsList = allFragments.keys.toList();

  // Play a sound with specified fragment name and speed.
  Future<void> playSound(String fragName, double speed) async {
    await stopPlay();
    await player.setPlaybackRate(speed);
    await player.play(AssetSource(resolveAudioPath(fragName)));
    //player.setReleaseMode(ReleaseMode.release);
  }

  // Stop playing the sound.
  Future<void> stopPlay() async {
    await player.release();
  }

  void setLoopMode(bool enableLoop) {
    if (enableLoop) {
      player.setReleaseMode(ReleaseMode.loop);
    } else {
      player.setReleaseMode(ReleaseMode.release);
    }
  }

  // Play a single random fragment.
  void randomPlay({bool stopAfterPlay = true}) {
    int randomIndex = rng.nextInt(fragmentCount);
    playSound(allFragmentsList[randomIndex], 1.0);
    if (stopAfterPlay) {
      player.onPlayerComplete.listen((event) {
        //Here goes the code that will be called when the audio finishes
        stopPlay();
      });
    }
  }

  // For keep playing random fragments.
  void randomPlayMultiple() {
    randomPlay(stopAfterPlay: false);
    player.onPlayerComplete.listen((event) {
      //Here goes the code that will be called when the audio finishes
      randomPlay(stopAfterPlay: false);
    });
  }

  // Single-time use player.
  Future<void> disposablePlay(String fragName) async {
    final tempPlayer = AudioPlayer();
    await tempPlayer.play(AssetSource(resolveAudioPath(fragName)));
    tempPlayer.onPlayerComplete.listen((_) {
      tempPlayer.dispose();
    });
  }

  // Used for the slider. First pause the sound, then adjust the speed, then resume.
  Future<void> adjustSpeed(double speed) async {
    await player.pause();
    await player.setPlaybackRate(speed);
    await player.resume();
  }
}
