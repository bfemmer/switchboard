import 'package:flutter/material.dart';
import 'package:switchboard/features/feed/data/models/feed.dart';
import 'package:switchboard/features/resources/presentation/widgets/media_card.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({required this.feed, super.key});

  final List<Feed> feed;

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
          itemCount: widget.feed.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: MediaCard(
                title: widget.feed[index].title!,
                subTitle: widget.feed[index].subtitle!,
                description: widget.feed[index].description!,
                linkUrl: null,
                imageUrl: 'assets/images/operators.png',
                // linkUrl: widget.feed[index].linkUrl,
                // imageUrl: widget.feed[index].imageUrl!,
              ),
            );
          },
        ),
      ),
    );
  }
}
