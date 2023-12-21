import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const String lorem =
    'Ad nulla mollit eiusmod nisi. Elit laboris ex ut enim nostrud laboris pariatur consequat nisi. Esse ipsum do ullamco ut anim deserunt esse pariatur quis dolore. Commodo id labore deserunt ullamco tempor eiusmod labore quis et nisi ad dolore.';

class SlideInfo {
  final String title, caption, imageUrl;

  SlideInfo(
      {required this.title, this.caption = lorem, required this.imageUrl});
}

final slides = <SlideInfo>[
  SlideInfo(title: 'Search the food', imageUrl: 'assets/images/1.png'),
  SlideInfo(title: 'Begging the food', imageUrl: 'assets/images/2.png'),
  SlideInfo(title: 'Eat the food', imageUrl: 'assets/images/3.png'),
  SlideInfo(
      title: 'Loading the food', imageUrl: 'assets/images/jar-loading.gif'),
];

class AppTutorialScreen extends StatelessWidget {
  static const String name = 'app_tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        PageView(
            physics: const BouncingScrollPhysics(),
            children: slides
                .map((data) => _Slide(
                    title: data.title,
                    caption: data.caption,
                    imageUrl: data.imageUrl))
                .toList()),
        Positioned(
          right: 25,
          top: 50,
          child: TextButton(
            child: const Text('Exit'),
            onPressed: () => context.pop(),
        ))
      ]),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title, caption, imageUrl;

  const _Slide(
      {required this.title, required this.caption, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;
    final (titleStyle, captionStyle) =
        (textTheme.titleLarge, textTheme.bodySmall);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(
              height: 20,
            ),
            Image(image: AssetImage(imageUrl)),
            const SizedBox(
              height: 30,
            ),
            Text(
              caption,
              style: captionStyle,
            )
          ],
        ),
      ),
    );
  }
}
