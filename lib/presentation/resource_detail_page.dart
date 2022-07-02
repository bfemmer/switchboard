import 'package:flutter/material.dart';

import '../model/resource.dart';
import '../utility/url_helper.dart';

class ResourceDetailPage extends StatefulWidget {
  final Resource resource;

  const ResourceDetailPage({Key? key, required this.resource})
      : super(key: key);

  @override
  ResourceDetailPageState createState() => ResourceDetailPageState();
}

class ResourceDetailPageState extends State<ResourceDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: const Text('Resource Details',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                          )),
                      background: Image.asset(
                        'assets/images/b52.jpeg',
                        fit: BoxFit.fill,
                      )),
                ),
              ];
            },
            body: SafeArea(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.resource.name!,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(widget.resource.description!),
                  ),
                  widget.resource.link != null
                      ? ButtonBar(
                          alignment: MainAxisAlignment.start,
                          children: [
                            TextButton(
                              onPressed: () {
                                UrlHelper.launchBrowser(widget.resource.link!);
                              },
                              child: Text(widget.resource.link!),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            )),
      ),
    );
  }
}
