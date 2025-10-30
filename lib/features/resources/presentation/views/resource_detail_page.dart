import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/data/models/resource.dart';
import 'package:switchboard/features/resources/presentation/widgets/resource_card.dart';

class ResourceDetailPage extends StatefulWidget {
  final Resource resource;

  const ResourceDetailPage({super.key, required this.resource});

  @override
  ResourceDetailPageState createState() => ResourceDetailPageState();
}

class ResourceDetailPageState extends State<ResourceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Result Details')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ResourceCard(resource: widget.resource),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
