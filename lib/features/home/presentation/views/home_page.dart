import 'package:flutter/material.dart';
import 'package:switchboard/features/home/presentation/viewmodels/feed_viewmodel.dart';
import 'package:switchboard/features/home/presentation/views/home_mobile_view.dart';

import '../../../../constants.dart';
import 'home_desktop_view.dart';
import 'home_tablet_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.viewmodel});
  final FeedViewModel viewmodel;
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
    widget.viewmodel.load.execute();
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: ListenableBuilder(
        listenable: widget.viewmodel.load,
        builder: (context, _) {
          return screenSize.width < breakpointSmall
              ? HomeMobileView(feed: widget.viewmodel.feed)
              : screenSize.width < breakpointMedium
              ? HomeTabletView(feed: widget.viewmodel.feed)
              : HomeDesktopView(feed: widget.viewmodel.feed);
        },
      ),
    );
  }
}
