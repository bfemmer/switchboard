import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/loader.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/apps/presentation/viewmodels/app_viewmodel.dart';

class AppListPage extends StatefulWidget {
  const AppListPage({super.key, required this.viewmodel});
  final AppViewModel viewmodel;
  static String route() => "/apps";

  @override
  AppListPageState createState() => AppListPageState();
}

class AppListPageState extends State<AppListPage> {
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
      appBar: AppBar(title: const Text('Apps')),
      body: SafeArea(
        child: ListenableBuilder(
          listenable: widget.viewmodel.load,
          builder: (context, _) {
            return Column(
              children: [
                Expanded(
                  child: widget.viewmodel.load.running
                      ? Loader()
                      : widget.viewmodel.apps.isEmpty
                      ? Center(
                          child: Text(
                            'No apps found',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        )
                      : _buildAppList(),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildAppList() {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      itemCount: widget.viewmodel.apps.length,
      itemBuilder: (context, index) {
        final app = widget.viewmodel.apps[index];
        return Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
          child: Card(
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ExpansionTile(
                  title: Text(app.name!),
                  subtitle: Text(app.organization!),
                  leading: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Image.asset('assets/images/${app.icon!}'),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(app.description!),
                    ),
                    OverflowBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            Theme.of(context).platform == TargetPlatform.iOS
                                ? UrlHelper.launchBrowser(app.applestore!)
                                : UrlHelper.launchBrowser(app.playstore!);
                          },
                          child:
                              Theme.of(context).platform == TargetPlatform.iOS
                              ? const Text('Visit Apple Store')
                              : const Text('Visit Google Play Store'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
