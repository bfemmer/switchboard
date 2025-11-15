import 'package:flutter/material.dart';
import 'package:switchboard/features/home/presentation/viewmodels/feed_viewmodel.dart';
import 'package:switchboard/features/home/presentation/views/home_mobile_view.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

import '../../../../constants.dart';
import 'home_desktop_view.dart';
import 'home_tablet_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
    required this.feedviewmodel,
    required this.resourceviewmodel,
  });
  final FeedViewModel feedviewmodel;
  final ResourceViewModel resourceviewmodel;
  static String route() => "/home";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.feedviewmodel.load.execute();
    widget.resourceviewmodel.loadVideos.execute();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListenableBuilder(
        listenable: Listenable.merge([
          widget.feedviewmodel.load,
          widget.resourceviewmodel.loadVideos,
        ]),
        builder: (context, _) {
          return screenSize.width < breakpointSmall
              ? HomeMobileView(
                  feed: widget.feedviewmodel.feed,
                  fapVideos: widget.resourceviewmodel.fapVideos,
                  canVideos: widget.resourceviewmodel.canVideos,
                  readyVideos: widget.resourceviewmodel.readyVideos,
                )
              : screenSize.width < breakpointMedium
              ? HomeTabletView(feed: widget.feedviewmodel.feed)
              : HomeDesktopView(feed: widget.feedviewmodel.feed);
        },
      ),
    );
  }
}
