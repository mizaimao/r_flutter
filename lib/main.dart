import 'package:flutter/material.dart';

import 'package:window_manager/window_manager.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'appData.dart';
import 'fragmentPage.dart';
import 'randomizerPage.dart';
import 'sequencerPage.dart';
import 'treasurePage.dart';
import 'futurePage.dart';
import 'utils.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Must add this line.
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = WindowOptions(
    size: Size(607, 865),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.normal,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  runApp(const RFlutterApp());
}

class AppState extends ChangeNotifier {}

class RFlutterApp extends StatelessWidget {
  const RFlutterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink.shade50),
      ),
      home: const NavigationInterface(),
    );
  }
}

class NavigationInterface extends StatefulWidget {
  const NavigationInterface({super.key});
  @override
  State<NavigationInterface> createState() => _NavigationInterfaceState();
}

class _NavigationInterfaceState extends State<NavigationInterface> {
  int currentPageIndex = 0;
  AppData appData = AppData();
  // late final PackageInfo packageInfo = await PackageInfo.fromPlatform();

  _NavigationInterfaceState() {
    getVersionInfo();
  }

  void getVersionInfo() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String platformInfo = getPlatformInfo();
    String appName = packageInfo.appName; // "R Collection"
    String version = packageInfo.version; // "0.7.5"
    // String packageName = packageInfo.packageName; // "com.example.r3"
    // String buildNumber = packageInfo.buildNumber; // "0.7.5"

    appData.versionInfo =
        "${appName}       version: ${version}       Platform: ${platformInfo}";
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      bottomNavigationBar: SizedBox(
        height: 55,
        child: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: theme.colorScheme.primary,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.grain),
              icon: Icon(Icons.grain),
              label: 'Randomizer',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.graphic_eq),
              icon: Icon(Icons.graphic_eq),
              label: 'Sequencer',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.chat_rounded),
              icon: Icon(Icons.chat_outlined),
              label: 'Fragments',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.local_movies),
              icon: Icon(Icons.local_movies_outlined),
              label: 'Treasure',
            ),
            NavigationDestination(
              selectedIcon: Icon(Icons.scatter_plot),
              icon: Icon(Icons.scatter_plot_outlined),
              label: 'Future',
            ),
          ],
        ),
      ),
      body: <Widget>[
        /// Randomizer page
        RandomizerPage(appData),

        /// Sequencer page
        SequencerPage(appData),

        /// Fragment page
        FragmentPage(appData),

        TreasurePage(appData),

        FuturePage(appData),

        /// Notifications page
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 1'),
                  subtitle: Text('This is a notification'),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.notifications_sharp),
                  title: Text('Notification 2'),
                  subtitle: Text('This is a notification'),
                ),
              ),
            ],
          ),
        ),

        /// Messages page
        ListView.builder(
          reverse: true,
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            if (index == 0) {
              return Align(
                alignment: Alignment.centerRight,
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Text(
                    'Hello',
                    style: theme.textTheme.bodyLarge!
                        .copyWith(color: theme.colorScheme.onPrimary),
                  ),
                ),
              );
            }
            return Align(
              alignment: Alignment.centerLeft,
              child: Container(
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Text(
                  'Hi!',
                  style: theme.textTheme.bodyLarge!
                      .copyWith(color: theme.colorScheme.onPrimary),
                ),
              ),
            );
          },
        ),
      ][currentPageIndex],
    );
  }
}
