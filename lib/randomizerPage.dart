import 'package:flutter/material.dart';

import 'singlePlayer.dart';
import 'playerManager.dart';
import 'appData.dart';

import 'files.dart';

const List<int> predefinedRepeats = [
  10,
  20,
  30,
  40,
  50,
  100,
  200,
  400,
  800,
  2000,
  9999
];

const List<int> predefinedChaos = [1, 2, 3, 4, 5, 6];

// Two lists used for predefined mixers. Order is [car1, car2, car3, ppl1, ppl2, pp3, cog_car, cog_ppl]
List<double> chaosPresets = [1.0, 3.0, 5.0, 1.0, 3.0, 4.0, 5.0, 5.0];
List<double> repeatPresets = [4.0, 5.0, 7.0, 2.0, 7.0, 7.0, 10.0, 10.0];

// [Display Name, Fragment Name]
const List<List<String>> predefinedPoisons = [
  ["so", "so"],
  ["R", "R"],
  ["yong", "ah yong ah"],
  ["suppose", "suppose"],
  ["oaic", "oaic"],
  ["tose", "for tose"],
  ["finally", "finally"],
];

const double gridIconSize = 64;

class RandomizerPage extends StatefulWidget {
  late AppData appData;
  RandomizerPage(this.appData);

  @override
  State<RandomizerPage> createState() => _RandomizerPageState(appData);
}

class _RandomizerPageState extends State<RandomizerPage> {
  late double chaosLevel = 0;
  late double repeatLevel = 0;
  late List<bool> selectedPoisons;
  late AppData appData;
  late PlayerManager pm;
  late SinglePlayer sPlayer;

  _RandomizerPageState(this.appData) {
    pm = appData.pm;
    sPlayer = appData.pm.sPlayerRandomizer;

    chaosLevel = appData.chaosLevel;
    repeatLevel = appData.repeatLevel;

    selectedPoisons = <bool>[
      for (int i = 0; i < predefinedPoisons.length; i++)
        i == appData.poisonIndex
    ];
  }
  @override
  Widget build(BuildContext context) {
    List<String> allFragmentsList = allFragments.keys.toList();
    int fragmentCount = allFragmentsList.length;

    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(randomizerBG),
          fit: BoxFit.cover,
        ),
      ),
      child: Align(
        alignment: Alignment.center,
        child: Column(children: [
          Card(
            color: theme.colorScheme.primary,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: TextButton(
                onPressed: () {
                  sPlayer.disposablePlay("who know this");
                },
                child: Text(
                  "Randomizer",
                  style: style,
                ),
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // Row for Top button set.
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 1),
                      Text("Fragment Randomizer"),
                      SizedBox(
                        width: 1,
                      ),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      Text("Total: $fragmentCount"),
                      SizedBox(width: 1),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        child: IconButton(
                            onPressed: () {
                              sPlayer.randomPlay();
                            },
                            icon: ImageIcon(AssetImage("assets/icons/dice.png"),
                                color: theme.colorScheme.primary, size: 48)),
                      ),
                      SizedBox(
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              sPlayer.stopPlay();
                              pm.stopComposed();
                            },
                            child: Text(
                              "Stop",
                              style: TextStyle(fontSize: 40.0),
                            )),
                      ),
                      SizedBox(
                        width: 120,
                        child: IconButton(
                            onPressed: () {
                              sPlayer.randomPlayMultiple();
                            },
                            icon: ImageIcon(
                                AssetImage("assets/icons/dice2.png"),
                                color: theme.colorScheme.primary,
                                size: 77)),
                      ),
                    ],
                  ),

                  // Row for slider set
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 1),
                      Text("Fragment Mixer"),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      SizedBox(width: 1),
                      Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    chaosLevel =
                                        appData.chaosLevel = chaosPresets[6];
                                    repeatLevel =
                                        appData.repeatLevel = repeatPresets[6];
                                  });
                                  pm.playComposed(
                                      predefinedChaos[chaosLevel.round()],
                                      predefinedRepeats[repeatLevel.round()],
                                      fragName: "so");
                                },
                                icon: ImageIcon(
                                    AssetImage("assets/icons/car_cog.png"),
                                    color: theme.colorScheme.primary,
                                    size: 24)),
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    chaosLevel =
                                        appData.chaosLevel = chaosPresets[7];
                                    repeatLevel =
                                        appData.repeatLevel = repeatPresets[7];
                                  });
                                  pm.playComposed(
                                    predefinedChaos[chaosLevel.round()],
                                    predefinedRepeats[repeatLevel.round()],
                                  );
                                },
                                icon: ImageIcon(
                                    AssetImage("assets/icons/people_cog.png"),
                                    color: theme.colorScheme.primary,
                                    size: 24))
                          ]),
                    ],
                  ),
                  SizedBox(width: 20),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          child: IconButton(
                              onPressed: () {
                                pm.playComposed(
                                    predefinedChaos[chaosLevel.round()],
                                    predefinedRepeats[repeatLevel.round()],
                                    fragName:
                                        predefinedPoisons[appData.poisonIndex]
                                            .last);
                              },
                              icon: ImageIcon(
                                  AssetImage("assets/icons/car1.png"),
                                  color: theme.colorScheme.primary,
                                  size: 64)),
                        ),
                        SizedBox(
                            width: 110,
                            child: Text(
                                "Chaos Level: ${predefinedChaos[chaosLevel.toInt()]}")),
                        SizedBox(
                          width: 180,
                          child: Slider(
                            value: chaosLevel,
                            max: predefinedChaos.length.toDouble() - 1,
                            divisions: predefinedChaos.length - 1,
                            label:
                                "Chaos Level: ${predefinedChaos[chaosLevel.toInt()]}",
                            onChanged: (double value) {
                              print(value);
                              setState(() {
                                chaosLevel = value;
                                appData.chaosLevel = value;
                              });
                            },
                          ),
                        ),
                      ]),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 90,
                          child: IconButton(
                              onPressed: () {
                                pm.playComposed(
                                  predefinedChaos[chaosLevel.round()],
                                  predefinedRepeats[repeatLevel.round()],
                                );
                              },
                              icon: ImageIcon(
                                  AssetImage("assets/icons/people3.png"),
                                  color: theme.colorScheme.primary,
                                  size: 64)),
                        ),
                        SizedBox(
                          width: 110,
                          child: Text(
                              "Repeats: ${predefinedRepeats[repeatLevel.toInt()]}"),
                        ),
                        SizedBox(
                          width: 180,
                          child: Slider(
                            value: repeatLevel,
                            max: predefinedRepeats.length.toDouble() - 1,
                            divisions: predefinedRepeats.length - 1,
                            label:
                                "Repeats: ${predefinedRepeats[repeatLevel.toInt()]}",
                            onChanged: (double value) {
                              setState(() {
                                repeatLevel = value;
                                appData.repeatLevel = value;
                              });
                            },
                          ),
                        ),
                      ]),

                  // Presets
                  SizedBox(
                    height: 30,
                  ),
                  Text("Mixer Presets"),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                chaosLevel =
                                    appData.chaosLevel = chaosPresets[0];
                                repeatLevel =
                                    appData.repeatLevel = repeatPresets[0];
                              });
                              pm.playComposed(
                                  predefinedChaos[chaosLevel.round()],
                                  predefinedRepeats[repeatLevel.round()],
                                  fragName:
                                      predefinedPoisons[appData.poisonIndex]
                                          .last);
                            },
                            icon: ImageIcon(AssetImage("assets/icons/car2.png"),
                                color: theme.colorScheme.primary,
                                size: gridIconSize)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                chaosLevel =
                                    appData.chaosLevel = chaosPresets[1];
                                repeatLevel =
                                    appData.repeatLevel = repeatPresets[1];
                              });
                              pm.playComposed(
                                  predefinedChaos[chaosLevel.round()],
                                  predefinedRepeats[repeatLevel.round()],
                                  fragName:
                                      predefinedPoisons[appData.poisonIndex]
                                          .last);
                            },
                            icon: ImageIcon(AssetImage("assets/icons/car4.png"),
                                color: theme.colorScheme.primary,
                                size: gridIconSize)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                chaosLevel =
                                    appData.chaosLevel = chaosPresets[2];
                                repeatLevel =
                                    appData.repeatLevel = repeatPresets[2];
                              });
                              pm.playComposed(
                                  predefinedChaos[chaosLevel.round()],
                                  predefinedRepeats[repeatLevel.round()],
                                  fragName:
                                      predefinedPoisons[appData.poisonIndex]
                                          .last);
                            },
                            icon: ImageIcon(AssetImage("assets/icons/car6.png"),
                                color: theme.colorScheme.primary,
                                size: gridIconSize)),
                      ]),
                  Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                chaosLevel =
                                    appData.chaosLevel = chaosPresets[3];
                                repeatLevel =
                                    appData.repeatLevel = repeatPresets[3];
                              });
                              pm.playComposed(
                                predefinedChaos[chaosLevel.round()],
                                predefinedRepeats[repeatLevel.round()],
                              );
                            },
                            icon: ImageIcon(
                                AssetImage("assets/icons/people2.png"),
                                color: theme.colorScheme.primary,
                                size: gridIconSize)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                chaosLevel =
                                    appData.chaosLevel = chaosPresets[4];
                                repeatLevel =
                                    appData.repeatLevel = repeatPresets[4];
                              });
                              pm.playComposed(
                                predefinedChaos[chaosLevel.round()],
                                predefinedRepeats[repeatLevel.round()],
                              );
                            },
                            icon: ImageIcon(
                                AssetImage("assets/icons/people4.png"),
                                color: theme.colorScheme.primary,
                                size: gridIconSize)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                chaosLevel =
                                    appData.chaosLevel = chaosPresets[5];
                                repeatLevel =
                                    appData.repeatLevel = repeatPresets[5];
                              });
                              pm.playComposed(
                                predefinedChaos[chaosLevel.round()],
                                predefinedRepeats[repeatLevel.round()],
                              );
                            },
                            icon: ImageIcon(
                                AssetImage("assets/icons/people7.png"),
                                color: theme.colorScheme.primary,
                                size: gridIconSize)),
                      ]),

                  // Row for poison selection
                  SizedBox(
                    height: 40,
                  ),
                  Text("Poison"),
                  SizedBox(
                    height: 20,
                  ),
                  ToggleButtons(
                    onPressed: (int index) {
                      setState(() {
                        // The button that is tapped is set to true, and the others to false.
                        for (int i = 0; i < selectedPoisons.length; i++) {
                          selectedPoisons[i] = i == index;
                        }
                        appData.poisonIndex = index;
                      });
                    },
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    // selectedBorderColor: theme.colorScheme.primary,
                    // selectedColor: Colors.white,
                    // fillColor: theme.colorScheme.secondary,
                    // color: theme.colorScheme.tertiary,
                    constraints: const BoxConstraints(
                      minHeight: 42.0,
                      minWidth: 65.0,
                    ),
                    isSelected: selectedPoisons,
                    children: [
                      for (List<String> poisonPair in predefinedPoisons)
                        Text(poisonPair.first)
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
}
