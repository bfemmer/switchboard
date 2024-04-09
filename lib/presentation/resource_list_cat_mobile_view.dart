import 'package:flutter/material.dart';

import '../model/resource.dart';
import 'widgets/resource_card.dart';

class ResourceListCatMobileView extends StatefulWidget {
  const ResourceListCatMobileView({required this.resources, super.key});

  final List<Resource> resources;

  @override
  State<ResourceListCatMobileView> createState() =>
      _ResourceListCatMobileViewState();
}

class _ResourceListCatMobileViewState extends State<ResourceListCatMobileView> {
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
