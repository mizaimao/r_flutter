import 'package:flutter/material.dart';
import 'singlePlayer.dart';

import 'files.dart';
import 'appData.dart';

BoxDecoration scrollViewBorderDec() {
  return BoxDecoration(
    border: Border(
      top: BorderSide(
        //                    <--- top side
        color: Colors.grey,
        width: 0.2,
      ),
    ),
  );
}

class SequencerPage extends StatelessWidget {
  late AppData appData;
  late SinglePlayer sPlayer;
  late SequencePlayer sequencePlayer;

  SequencerPage(this.appData) {
    sPlayer = appData.pm.sPlayerSequencer;
    sequencePlayer = appData.pm.sequencePlayer;
  }

  List<Widget> getSequenceAndDivider() {
    List<Widget> widgetList = [];
    for (List<String> playlist in allPlaylists) {
      widgetList.add(TextButton(
          style: ButtonStyle(
            alignment: Alignment.centerLeft,
          ),
          onPressed: () {
            sequencePlayer.playSequence(playlist = playlist);
          },
          child: Text(playlist.join(', '),
              style: TextStyle(), textAlign: TextAlign.left)));
      // widgetList.add(
      //   Divider(
      //     thickness: 0.1,
      //     color: Colors.grey,
      //   ),
      // );
    }
    return widgetList;
  }

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
          image: AssetImage(sequencerBG),
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
                      "Sequencer",
                      style: style,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            sPlayer.disposablePlay("so");
                          },
                          child: Text(
                            "so",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            sPlayer.disposablePlay("deepist");
                          },
                          child: Text(
                            "HHL",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 120,
                    child: TextButton(
                        onPressed: () {
                          sequencePlayer.stopPlay();
                        },
                        child: Text(
                          "Stop",
                          style: TextStyle(fontSize: 40.0),
                        )),
                  ),
                  SizedBox(
                    width: 120,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            sPlayer.disposablePlay("finally");
                          },
                          child: Text(
                            "finally",
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        sPlayer.disposablePlay("for tose");
                      },
                      child: Text(
                        "tose",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        sPlayer.disposablePlay("R");
                      },
                      child: Text(
                        "R",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        sPlayer.disposablePlay("oh no cannot");
                      },
                      child: Text(
                        "cannod",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    SizedBox(width: 1),
                    SizedBox(width: 1),
                    TextButton(
                      onPressed: () {
                        sPlayer.disposablePlay("oaic");
                      },
                      child: Text(
                        "oaic",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        sPlayer.disposablePlay("okay stop ty");
                      },
                      child: Text(
                        "tyvm",
                        style: TextStyle(fontSize: 18.0),
                      ),
                    ),
                  ]),
              SizedBox(height: 5),
              Divider(
                // height: 20,
                thickness: 0.3,
                // indent: 20,
                // endIndent: 0,
                color: Colors.grey,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: getSequenceAndDivider()),
                ),
              ),
            ],
          )),
    ));
  }
}
