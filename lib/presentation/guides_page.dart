import 'package:flutter/material.dart';

import 'guides_list_page.dart';

class GuidesPage extends StatefulWidget {
  const GuidesPage({Key? key}) : super(key: key);

  @override
  State<GuidesPage> createState() => _GuidesPageState();
}

class _GuidesPageState extends State<GuidesPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 3.0,
              clipBehavior: Clip.antiAlias,
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        child: Image.asset(
                          'assets/images/resilience.png',
                        )),
                    title: const Text('Quick Guides Overview'),
                    subtitle: Text(
                      'For non-emergency assistance',
                      style: TextStyle(color: Colors.black.withOpacity(0.6)),
                    ),
                  ),
                  Container(
                    color: Colors.blue.shade50,
                    child: Row(
                      children: [
                        Flexible(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Text(
                              'The DAF goal is to PREVENT harm before it happens to ourselves or others.  How can we prevent harm before it happens? By learning and applying resilience skills that help us and others navigate through life\'s challenges. \n\nPREVENTION - Build skills or obtain assistance needed to prevent a harmful event from occurring. \n\nINTERVENTION - Know what to do, how to help or who to call when we see a potentially harmful event occurring. \n\nRESPONSE - Know how to provide care or support or access helpful services after a harmful event occurs.\n\nIf you or someone you know is in crisis now, call 911 for emergency assistance or 988 / CONUS to speak to a crisis counselor.\n\nIf there\'s no emergency, see the quick guides below which may assist with various situations.',
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 8.0,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const GuidesListPage();
              }));
            },
            style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
            child: const Text('View Guides'),
          )
        ],
      ),
    );
  }
}
