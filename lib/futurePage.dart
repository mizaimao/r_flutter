import 'dart:math';
import 'package:flutter/material.dart';
import 'appData.dart';

// import 'package:flutter_gif/flutter_gif.dart';

import 'files.dart';
import 'singlePlayer.dart';

class FuturePage extends StatefulWidget {
  late AppData appData;
  FuturePage(this.appData);
  @override
  State<FuturePage> createState() => _FuturePageState(appData);
}

class _FuturePageState extends State<FuturePage> {
  late AppData appData;
  late bool enableButton = false;
  late Color rButtonColor = Colors.black;
  late SinglePlayer sPlayer;

  _FuturePageState(this.appData) {
    enableButton = appData.enableButton;
    rButtonColor = appData.rButtonColor;
    sPlayer = appData.pm.sPlayerFuture;
  }

  Color rColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(futureBG),
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
                      "We just use R",
                      style: style,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Stack(children: <Widget>[
                          if (!enableButton)
                            Text(
                              "R",
                              style: TextStyle(
                                  fontSize: 160,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          if (enableButton)
                            TextButton(
                              style: ButtonStyle(
                                  overlayColor: MaterialStateProperty.all(
                                      Colors.transparent)),
                              onPressed: () {
                                sPlayer.disposablePlay("oaic");
                                setState(() {
                                  enableButton = false;
                                  appData.enableButton = false;
                                  rButtonColor = Colors.black;
                                  appData.rButtonColor = Colors.black;
                                });
                              },
                              child: Text(
                                "R",
                                style: TextStyle(
                                    fontSize: 160, color: rButtonColor),
                              ),
                            ),
                        ]),
                        Text(
                            //"Version: ${version_number}       Build: ${build_number}",
                            "${appData.versionInfo}",
                            style: TextStyle(fontSize: 10, color: Colors.grey)),
                        SizedBox(
                          height: 80,
                        ),
                        Stack(
                          children: <Widget>[
                            Align(
                              alignment: Alignment.center,
                              child: Image.asset(
                                  "assets/images/liang_dancing.gif"),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: TextButton(
                                style: ButtonStyle(
                                    overlayColor: MaterialStateProperty.all(
                                        Colors.transparent)),
                                onPressed: () {
                                  sPlayer.disposablePlay("R");
                                  Color randomColor = Colors.primaries[Random()
                                      .nextInt(Colors.primaries.length)];
                                  setState(() {
                                    enableButton = true;
                                    rButtonColor = randomColor;
                                  });
                                  appData.enableButton = true;
                                  appData.rButtonColor = randomColor;
                                },
                                child: Text(
                                  "AA",
                                  style: TextStyle(
                                      fontSize: 110, color: Colors.transparent),
                                ),
                              ),
                            )
                          ],
                        ),
                      ]),
                ),
              ),
            ],
          )),
    ));
  }
}
