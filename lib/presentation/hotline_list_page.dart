import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../model/resource.dart';
import '../repository/resource_repository.dart';
import '../repository/sqlite/sqlite_resource_repository.dart';
import '../utility/url_helper.dart';

class HotlineListPage extends StatefulWidget {
  const HotlineListPage({Key? key}) : super(key: key);

  @override
  HotlineListPageState createState() => HotlineListPageState();
}

class HotlineListPageState extends State<HotlineListPage> {
  late List<Resource> hotlines;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Resource>>(
        future: _getHotlines(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          return SafeArea(
            child: ListView(
              children: snapshot.data!
                  .map((hotline) => Padding(
                        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: Card(
                          //margin: const EdgeInsets.symmetric(vertical: 8),
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              ExpansionTile(
                                title: Text(hotline.name!),
                                leading: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  radius: 15,
                                  child: Image.asset(
                                    'assets/images/jack.png',
                                    color: Colors.blue,
                                  ),
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(hotline.description!),
                                  ),
                                  ButtonBar(
                                    alignment: MainAxisAlignment.start,
                                    children: [
                                      TextButton(
                                        onPressed: () {
                                          UrlHelper.launchBrowser(
                                              hotline.link!);
                                        },
                                        child: const Text("Learn more"),
                                        // icon: const FaIcon(
                                        //     FontAwesomeIcons.earthAmericas),
                                        // color: Colors.blue,
                                      ),
                                      hotline.voice != null
                                          ? IconButton(
                                              onPressed: () {
                                                UrlHelper.makePhoneCall(
                                                    hotline.voice!);
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.phone),
                                              color: Colors.blue,
                                            )
                                          : Container(),
                                      hotline.sms != null
                                          ? IconButton(
                                              onPressed: () {
                                                UrlHelper.textMessage(
                                                    hotline.sms!);
                                              },
                                              icon: const FaIcon(
                                                  FontAwesomeIcons.commentSms),
                                              color: Colors.blue,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ))
                  .toList(),
            ),
          );
        },
      ),
    );
  }

  Future<List<Resource>> _getHotlines() async {
    ResourceRepository repository = SqliteResourceRepository();

    hotlines = await repository.getHotlines();
    return hotlines;
  }
}
