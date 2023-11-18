import 'package:destiny_game/story_brain.dart';
import 'package:flutter/material.dart';

var storyBrain = StoryBrain();

void main() {
  runApp(const DestinyHome());
}

class DestinyHome extends StatelessWidget {
  const DestinyHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const DestinyPage();
  }
}

class DestinyPage extends StatefulWidget {
  const DestinyPage({super.key});

  @override
  State<DestinyPage> createState() => _DestinyPageState();
}

class _DestinyPageState extends State<DestinyPage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('images/background.png'),
                  fit: BoxFit.cover),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                    flex: 12,
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Text(
                        storyBrain.getStory(),
                        style:
                            const TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ))),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 10.0),
                      child: Visibility(
                        visible: storyBrain.buttonShouldBeVisible(),
                        child: TextButton(
                          onPressed: () {
                            setState(() {
                              storyBrain.nextStory(1);
                            });
                          },
                          style:
                              TextButton.styleFrom(backgroundColor: Colors.blue),
                          child: const Text(
                            'Choice 1',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            storyBrain.nextStory(2);
                          });
                        },
                        style:
                            TextButton.styleFrom(backgroundColor: Colors.red),
                        child: const Text('Choice 2',
                            style:
                                TextStyle(color: Colors.white, fontSize: 25)),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
