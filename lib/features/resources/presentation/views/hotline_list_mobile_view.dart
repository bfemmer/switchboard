import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/presentation/widgets/resource_card.dart';

class HotlineListMobileView extends StatefulWidget {
  const HotlineListMobileView({required this.resources, super.key});

  final List<Resource> resources;

  @override
  State<HotlineListMobileView> createState() => _HotlineListMobileViewState();
}

class _HotlineListMobileViewState extends State<HotlineListMobileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView.builder(
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
