import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/feed/data/models/feed.dart';

import '../../../resources/presentation/widgets/media_card.dart';

class HomeTabletView extends StatefulWidget {
  const HomeTabletView({required this.feed, super.key});

  final List<Feed> feed;

  @override
  State<HomeTabletView> createState() => _HomeTabletViewState();
}

class _HomeTabletViewState extends State<HomeTabletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 2,
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
