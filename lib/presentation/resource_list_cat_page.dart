import 'package:flutter/material.dart';
import 'package:switchboard/presentation/resource_list_desktop_view.dart';

import '../constants.dart';
import '../model/category.dart';
import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';
import 'resource_list_mobile_view.dart';
import 'resource_list_tablet_view.dart';

class ResourceListCatPage extends StatefulWidget {
  final Category category;

  const ResourceListCatPage({super.key, required this.category});

  @override
  ResourceListCatPageState createState() => ResourceListCatPageState();
}

class ResourceListCatPageState extends State<ResourceListCatPage> {
  late List<Resource> resources;

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.category.name!),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).platform == TargetPlatform.iOS
                  ? Icons.ios_share
                  : Icons.share,
              //color: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              String subject =
                  'Resilience Resources - ${widget.category.name!}';
              String body = '';

              for (var i = 0; i < resources.length; i++) {
                body += '${resources[i].name!}\n\n';

                body += '${resources[i].description!}\n';

                if (resources[i].link != null) {
                  body += '\nWeb: ${resources[i].link!}';
                }

                if (resources[i].voice != null) {
                  body += '\nPhone: ${resources[i].voice!}';
                }

                if (resources[i].sms != null) {
                  body += '\nText Message: ${resources[i].sms!}';
                }

                body += '\n\n --- \n\n';
              }

              UrlHelper.sendEmail(subject, body);
            },
          )
        ],
      ),
      body: FutureBuilder<List<Resource>>(
        future: getResources(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          if (screenSize.width < breakpointSmall) {
            return ResourceListMobileView(
              resources: resources,
            );
          } else if (screenSize.width < breakpointMedium) {
            return ResourceListTabletView(
              resources: resources,
            );
          } else {
            return ResourceListDesktopView(
              resources: resources,
            );
          }
        },
      ),
    );
  }

  Future<List<Resource>> getResources() async {
    ResourceRepository repository = SqliteResourceRepository();

    resources = await repository.getResourcesByCategoryId(widget.category.id!);
    return resources;
  }
}
