import 'package:flutter/material.dart';
import 'package:switchboard/features/feed/data/models/feed.dart';
import 'package:switchboard/features/feed/presentation/viewmodels/feed_viewmodel.dart';
import 'package:switchboard/features/home/presentation/views/home_mobile_view.dart';
import 'package:switchboard/repository/resource_repository.dart';
import 'package:switchboard/repository/sqlite/sqlite_resource_repository.dart';

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
  late List<Feed> feed;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: FutureBuilder<List<Feed>>(
        future: _getFeed(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (screenSize.width < breakpointSmall) {
            return HomeMobileView(feed: feed);
          } else if (screenSize.width < breakpointMedium) {
            return HomeTabletView(feed: feed);
          } else {
            return HomeDesktopView(feed: feed);
          }
        },
      ),
    );
  }

  Future<List<Feed>> _getFeed() async {
    ResourceRepository repository = SqliteResourceRepository();

    feed = await repository.getFeed();
    return feed;
  }
}
