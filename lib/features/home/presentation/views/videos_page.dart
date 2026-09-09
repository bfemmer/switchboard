import 'package:flutter/material.dart';
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
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.loadVideos,
          builder: (context, _) {
            return ResponsiveHomeBody(viewModel: widget.viewmodel);
          },
        ),
      ),
    );
  }
}
