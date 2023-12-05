import 'dart:async';

import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({
    super.key,
  });

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel>
    with SingleTickerProviderStateMixin {
  late PageController _pageController;
  late AnimationController _controller;
  Timer? timer;

  List<String> images = [
    'assets/images/b52.jpeg',
    'assets/images/b52.jpeg',
    'assets/images/b52.jpeg',
  ];

  int activePage = 1;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.75, initialPage: 1);
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));

    timer = Timer.periodic(
      const Duration(seconds: 5),
      (timer) {
        // Callback will be executed every 5 seconds, increament page
        // count on each callback and animate to page
        setState(() {
          activePage = (activePage >= images.length - 1)
              ? activePage = 0
              : activePage += 1;

          _controller.forward();
          _pageController.animateToPage(activePage,
              duration: const Duration(seconds: 1), curve: Curves.linear);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 300,
          child: PageView.builder(
              itemCount: images.length,
              pageSnapping: true,
              controller: _pageController,
              onPageChanged: (page) {
                setState(() {
                  activePage = page;
                });
              },
              itemBuilder: (context, pagePosition) {
                bool active = pagePosition == activePage;
                return slider(images, pagePosition, active);
              }),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: indicators(images.length, activePage))
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    timer?.cancel();
  }
}

AnimatedContainer slider(images, pagePosition, active) {
  double margin = active ? 2 : 10;

  return AnimatedContainer(
    duration: const Duration(milliseconds: 300),
    curve: Curves.easeInOutCubic,
    margin: EdgeInsets.all(margin),
    decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(images[pagePosition])),
        borderRadius: BorderRadius.circular(20)),
  );
}

imageAnimation(PageController animation, images, pagePosition) {
  return AnimatedBuilder(
    animation: animation,
    builder: (context, widget) {
      return SizedBox(
        width: 200,
        height: 200,
        child: widget,
      );
    },
    child: Container(
      margin: const EdgeInsets.all(10),
      child: Image.asset(images[pagePosition]),
    ),
  );
}

List<Widget> indicators(imagesLength, currentIndex) {
  return List<Widget>.generate(imagesLength, (index) {
    return Container(
      margin: const EdgeInsets.all(3),
      width: 10,
      height: 10,
      decoration: BoxDecoration(
          color: currentIndex == index ? Colors.blue : Colors.black26,
          shape: BoxShape.circle),
    );
  });
}
