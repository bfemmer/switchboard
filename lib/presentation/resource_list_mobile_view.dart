import 'package:flutter/material.dart';

import '../model/resource.dart';
import 'widgets/resource_card.dart';

class ResourceListMobileView extends StatefulWidget {
  const ResourceListMobileView({required this.resources, super.key});

  final List<Resource> resources;

  @override
  State<ResourceListMobileView> createState() => _ResourceListMobileViewState();
}

class _ResourceListMobileViewState extends State<ResourceListMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView.builder(
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
