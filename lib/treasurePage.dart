import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'files.dart';
import 'appData.dart';
import 'singlePlayer.dart';
import 'playerManager.dart';

final bool isOnWeb = true; //bool.fromEnvironment('dart.library.js_util');

class MediaListRetriever {
  List<String> getMediaFiles() {
    if (isOnWeb) {
      return <String>[
        'assets/media/2011_x265.mp4',
        'assets/media/2012_x265.m4a',
        'assets/media/2023_x265.m4a',
      ];
    } else {
      return <String>[
        'assets/media/2011_audio.m4a',
        'assets/media/2011_x265.mp4',
        'assets/media/2012_audio.m4a',
        'assets/media/2012_x265.mp4',
        'assets/media/2023_audio.m4a',
        'assets/media/2023_x265.mp4',
      ];
    }
  }

  List<Text> getMediaList() {
    if (isOnWeb) {
      return <Text>[
        Text('2011'),
        Text('2012'),
        Text('2023'),
      ];
    } else {
      return <Text>[
        Text('2011A'),
        Text('2011V'),
        Text('2012A'),
        Text('2012V'),
        Text('2023A'),
        Text('2023V'),
      ];
    }
  }

  List<bool> getDefaultToggles() {
    if (isOnWeb) {
      return <bool>[false, true, false];
    } else {
      return <bool>[false, false, true, false, false, false];
    }
  }

  // Return an index pointing to the 2012 video.
  int getDefaultMediaIndex() {
    if (isOnWeb) {
      return 1;
    } else {
      return 3;
    }
  }
}

final Uri url2011 =
    Uri.parse('https://youtu.be/xeU5gl3w-OE?si=mgXMJYQ10wt6Nwu_');
final Uri url2012 =
    Uri.parse('https://youtu.be/rd6qNEjJfps?si=fKrTDXhw54zcFrvZ');
final Uri url2023 =
    Uri.parse('https://youtu.be/IWIvy7GM7DI?si=en4rFPHfIQoCc0hQ');

class TreasurePage extends StatefulWidget {
  late AppData appData;
  TreasurePage(this.appData);
  @override
  State<TreasurePage> createState() => _TreasurePageState(appData);
}

class _TreasurePageState extends State<TreasurePage> {
  late AppData appData;
  late PlayerManager pm;
  late SinglePlayer sPlayer;
  late List<bool> selectedPosions; // bool list for which poison is toggled
  late List<String> mediaFiles; // URL or file path to media files
  late List<Text> mediaList; // Media display names in the toggle UI

  _TreasurePageState(this.appData) {
    pm = appData.pm;
    sPlayer = appData.pm.sPlayerTreasure;

    MediaListRetriever retriever = MediaListRetriever();
    selectedPosions = retriever.getDefaultToggles();
    mediaFiles = retriever.getMediaFiles();
    mediaList = retriever.getMediaList();
  }

  @override
  void initState() {
    super.initState();
    // Play a [Media] or [Playlist].
    //player.open(Media('assets/media/2011_audio.m4a'));
    //player.open(Media(mediaFiles[retriever.getDefaultMediaIndex()]));
  }

  @override
  void dispose() {
    // player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme.displayMedium!.copyWith(
      color: theme.colorScheme.onPrimary,
    );

    Future<void> _launchUrl(Uri url) async {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw Exception('Could not launch $url');
      }
    }

    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(treasureBG),
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
                      "Treasures",
                      style: style,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(children: [
                    // Column(
                    //   children: [
                    //     FractionallySizedBox(
                    //       widthFactor: 0.6,
                    //       child: Image.asset('assets/media/2011.jpg',
                    //           fit: BoxFit.contain),
                    //     ),
                    //   ],
                    // ),
                    Text('2011: Hua Liang, PhD'),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/media/2011.jpg",
                          height: 180,
                          width: 320,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            _launchUrl(url2011);
                            sPlayer.disposablePlay("oaic");
                          },
                          child: Text(
                            "IIIIIIII",
                            style: TextStyle(
                                fontSize: 130, color: Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Text(
                        '2012: Hua Liang: An introduction to R (2012 CBIM Summer School)'),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/media/2012.jpg",
                          height: 180,
                          width: 320,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            _launchUrl(url2012);
                            sPlayer.disposablePlay("oaic");
                          },
                          child: Text(
                            "IIIIIIII",
                            style: TextStyle(
                                fontSize: 130, color: Colors.transparent),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    Text('2023: SFSN Presents: Hua Liang'),
                    Stack(
                      children: [
                        Image.asset(
                          "assets/media/2023.jpg",
                          height: 180,
                          width: 320,
                        ),
                        TextButton(
                          style: ButtonStyle(
                              overlayColor: MaterialStateProperty.all(
                                  Colors.transparent)),
                          onPressed: () {
                            _launchUrl(url2023);
                            sPlayer.disposablePlay("oaic");
                          },
                          child: Text(
                            "IIIIIIII",
                            style: TextStyle(
                                fontSize: 130, color: Colors.transparent),
                          ),
                        ),
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
