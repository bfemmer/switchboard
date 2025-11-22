import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/widgets/responsive_resource_body.dart';

class ResourceListPage extends StatefulWidget {
  const ResourceListPage({super.key, required this.viewmodel});
  final ResourceViewModel viewmodel;
  static String route() => "/resources";

  @override
  ResourceListPageState createState() => ResourceListPageState();
}

class ResourceListPageState extends State<ResourceListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Browse Resources')),
      body: ListenableBuilder(
        listenable: widget.viewmodel.load,
        builder: (context, _) {
          return ResponsiveResourceBody(resources: widget.viewmodel.resources);
        },
      ),
    );
  }
}
