import 'package:flutter/material.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';
import 'package:switchboard/features/resources/presentation/widgets/responsive_resource_body.dart';

import '../../../../core/utils/url_helper.dart';

class ResourceListCatPage extends StatefulWidget {
  final String categoryId;
  final String categoryName;
  final ResourceViewModel viewmodel;
  static String route() => "/resourcesbycategory/:categoryId/:categoryName";

  const ResourceListCatPage({
    super.key,
    required this.categoryId,
    required this.categoryName,
    required this.viewmodel,
  });

  @override
  ResourceListCatPageState createState() => ResourceListCatPageState();
}

class ResourceListCatPageState extends State<ResourceListCatPage> {
  int _id = 0;

  @override
  void initState() {
    super.initState();

    final int? id = int.tryParse(widget.categoryId);
    _id = id ?? 0;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    widget.viewmodel.loadForCategory.execute(_id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName),
        actions: [_buildActionButton()],
      ),
      body: ListenableBuilder(
        listenable: widget.viewmodel.loadForCategory,
        builder: (context, _) {
          return ResponsiveResourceBody(resources: widget.viewmodel.resources);
        },
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   var screenSize = MediaQuery.of(context).size;

  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(widget.categoryName),
  //       actions: [_buildActionButton()],
  //     ),
  //     body: ListenableBuilder(
  //       listenable: widget.viewmodel.loadForCategory,
  //       builder: (context, _) {
  //         return screenSize.width < breakpointSmall
  //             ? ResourceListMobileView(resources: widget.viewmodel.resources)
  //             : screenSize.width < breakpointMedium
  //             ? ResourceListTabletView(resources: widget.viewmodel.resources)
  //             : ResourceListDesktopView(resources: widget.viewmodel.resources);
  //       },
  //     ),
  //   );
  // }

  Widget _buildActionButton() {
    return IconButton(
      icon: Icon(
        Theme.of(context).platform == TargetPlatform.iOS
            ? Icons.ios_share
            : Icons.share,
      ),
      onPressed: () {
        String subject = 'Resilience Resources - ${widget.categoryName}';
        String body = '';

        for (var i = 0; i < widget.viewmodel.resources.length; i++) {
          body += '${widget.viewmodel.resources[i].name!}\n\n';

          body += '${widget.viewmodel.resources[i].description!}\n';

          if (widget.viewmodel.resources[i].link != null) {
            body += '\nWeb: ${widget.viewmodel.resources[i].link!}';
          }

          if (widget.viewmodel.resources[i].voice != null) {
            body += '\nPhone: ${widget.viewmodel.resources[i].voice!}';
          }

          if (widget.viewmodel.resources[i].sms != null) {
            body += '\nText Message: ${widget.viewmodel.resources[i].sms!}';
          }

          body += '\n\n --- \n\n';
        }

        UrlHelper.sendEmail(subject, body);
      },
    );
  }
}
