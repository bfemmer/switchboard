import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../model/resource.dart';
import 'widgets/resource_card.dart';

class ResourceListCatTabletView extends StatefulWidget {
  const ResourceListCatTabletView({required this.resources, super.key});

  final List<Resource> resources;

  @override
  State<ResourceListCatTabletView> createState() =>
      _ResourceListCatTabletViewState();
}

class _ResourceListCatTabletViewState extends State<ResourceListCatTabletView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: MasonryGridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 4,
        itemCount: widget.resources.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: ResourceCard(
              resource: widget.resources[index],
            ),
          );
        },
      )),
    );
  }
}
