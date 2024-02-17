import 'package:flutter/material.dart';

import 'files.dart';
import 'singlePlayer.dart';
import 'playerManager.dart';
import 'appData.dart';

List<List<String>> buildFragment2D(int nRows) {
  List<String> allFragmentsList = allFragments.keys.toList();
  int elementCount = allFragments.length ~/ nRows;
  int remainder = allFragments.length - nRows * elementCount;
  List<List<String>> allFragments2D = [for (int i = 0; i < nRows; i++) []];

  List<int> elementPerList = [];
  for (int i = 0; i < nRows; i++) {
    if (remainder > 0) {
      elementPerList.add(elementCount + 1);
      remainder--;
    } else {
      elementPerList.add(elementCount);
    }
  }
  int totalIndex = 0;
  for (int i = 0; i < nRows; i++) {
    for (int j = 0; j < elementPerList[i]; j++) {
      allFragments2D[i].add(allFragmentsList[totalIndex]);
      totalIndex++;
    }
  }
  return allFragments2D;
}

List<DropdownMenuEntry<int>> rowEntries = [
  for (int i = 2; i < 11; i++)
    DropdownMenuEntry<int>(
      value: i,
      label: i.toString(),
    )
];

class FragmentPage extends StatefulWidget {
  late AppData appData;
  FragmentPage(this.appData);

  @override
  State<FragmentPage> createState() => _FragmentPageState(appData);
}

class _FragmentPageState extends State<FragmentPage> {
  late bool brainWashToggle = false;
  late double playSpeed = 1.0;
  late AppData appData;
  late PlayerManager pm;
  late SinglePlayer sPlayer;
  late int colCount;

  //final sPlayer = SinglePlayer();
  _FragmentPageState(this.appData) {
    pm = appData.pm;
    sPlayer = appData.pm.sPlayerFragement;
    brainWashToggle = appData.brainWashToggle;
    playSpeed = appData.playSpeed;
    colCount = appData.colCount;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    List<List<String>> allFragments2D = buildFragment2D(colCount);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(fragmentBG),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Column(
            children: [
              Card(
                color: theme.colorScheme.primary,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextButton(
                    onPressed: () {
                      sPlayer.disposablePlay("who know this");
                    },
                    child: Text(
                      "Collection",
                      style: style,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Brainwash Mode:"),
                  Switch(
                      value: brainWashToggle,
                      onChanged: (bool value) {
                        sPlayer.setLoopMode(value);
                        setState(() {
                          brainWashToggle = value;
                          appData.brainWashToggle = value;
                        });
                      }),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          playSpeed = 1.0;
                          sPlayer.adjustSpeed(1.0);
                          appData.playSpeed = 1.0;
                        });
                      },
                      child: Text("Speed")),
                  Text("$playSpeed x"),
                  Slider(
                    value: playSpeed,
                    max: 2.0,
                    min: 0.1,
                    divisions: 19,
                    label: playSpeed.toStringAsFixed(1),
                    onChanged: (double value) {
                      setState(() {
                        playSpeed = double.parse(value.toStringAsFixed(1));
                        sPlayer.adjustSpeed(value);
                        appData.playSpeed = value;
                      });
                    },
                  ),
                ],
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: 120),
                    SizedBox(
                      width: 120,
                      child: TextButton(
                          onPressed: () {
                            sPlayer.stopPlay();
                          },
                          child: Text(
                            "Stop",
                            style: TextStyle(fontSize: 40.0),
                          )),
                    ),
                    SizedBox(
                      width: 120,
                      child: DropdownMenu<int>(
                        label: Text('Cols'),
                        initialSelection: appData.colCount,
                        onSelected: (int? value) {
                          setState(() {
                            colCount = value!;
                            appData.colCount = value;
                          });
                        },
                        dropdownMenuEntries: rowEntries,
                      ),
                    ),
                  ]),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    for (int i = 0; i < colCount; i++)
                      SingleChildScrollView(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            for (String frag in allFragments2D[i])
                              TextButton(
                                onPressed: () {
                                  sPlayer.playSound(frag, playSpeed);
                                },
                                child: Text(frag),
                              ),
                          ],
                        ),
                      ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
