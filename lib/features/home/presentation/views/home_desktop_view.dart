import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/home/data/models/feed.dart';

import '../../../resources/presentation/widgets/media_card.dart';

class HomeDesktopView extends StatefulWidget {
  const HomeDesktopView({required this.feed, super.key});

  final List<Feed> feed;

  @override
  State<HomeDesktopView> createState() => _HomeDesktopViewState();
}

class _HomeDesktopViewState extends State<HomeDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 4,
          itemCount: widget.feed.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: MediaCard(
                title: widget.feed[index].title!,
                subTitle: widget.feed[index].subtitle!,
                description: widget.feed[index].description!,
                linkUrl: widget.feed[index].linkUrl,
                imageUrl: widget.feed[index].imageUrl!,
              ),
            );
          },
        ),
      ),
    );
  }
}
