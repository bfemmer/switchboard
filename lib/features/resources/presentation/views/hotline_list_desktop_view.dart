import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';

import '../widgets/resource_card.dart';

class HotlineListDesktopView extends StatefulWidget {
  const HotlineListDesktopView({required this.resources, super.key});

  final List<Resource> resources;

  @override
  State<HotlineListDesktopView> createState() => _HotlineListDesktopViewState();
}

class _HotlineListDesktopViewState extends State<HotlineListDesktopView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MasonryGridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 12,
          crossAxisSpacing: 4,
          itemCount: widget.resources.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: ResourceCard(resource: widget.resources[index]),
            );
          },
        ),
      ),
    );
  }
}
