import 'package:flutter/material.dart';

import 'appData.dart';
import 'fragmentPage.dart';
import 'randomizerPage.dart';
import 'sequencerPage.dart';
import 'treasurePage.dart';
import 'futurePage.dart';

/// Flutter code sample for [NavigationBar].

void main() {
  //MediaKit.ensureInitialized();
  runApp(const NavigationBarApp());
}

class AppState extends ChangeNotifier {}

class NavigationBarApp extends StatelessWidget {
  const NavigationBarApp({super.key});

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
  //var appState = context.watch<AppState>();

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
