import 'package:flutter/material.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/features/home/presentation/widgets/responsive_home_body.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

class VideosPage extends StatefulWidget {
  const VideosPage({super.key, required this.viewmodel});

  final ResourceViewModel viewmodel;
  static String route() => "/videos";

  @override
  State<VideosPage> createState() => _VideosPageState();
}

class _VideosPageState extends State<VideosPage> {
  @override
  void initState() {
    super.initState();
    widget.viewmodel.loadVideos.execute();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Videos'),
        elevation: 0,
        actions: buildAppBarActions(context),
      ),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.loadVideos,
          builder: (context, _) {
            if (widget.viewmodel.loadVideos.running) {
              return const Loader();
            }
            return ResponsiveHomeBody(viewModel: widget.viewmodel);
          },
        ),
      ),
    );
  }
}

