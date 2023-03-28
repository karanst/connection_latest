import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:story/story_page_view.dart';


class StoryDemo extends StatefulWidget {
  @override
  State<StoryDemo> createState() => _StoryDemoState();
}

class _StoryDemoState extends State<StoryDemo> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Story demo',
        theme: ThemeData(
          primarySwatch: Colors.brown,
        ),
        home: Scaffold(

            body: StoryPageView(
              itemBuilder: (BuildContext context, int pageIndex, int storyIndex) {
                return Center(
                    child:Image.asset("assets/images/googleimage.png")
                  // Text("PageView Index: pageIndex  Story Index: storyIndex"),
                );
              },
              storyLength: (int pageIndex) {
                return 3;
              },
              pageLength: 2,
            )));
  }
}