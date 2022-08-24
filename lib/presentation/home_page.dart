import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/presentation/widgets/media_card.dart';

import '../utility/fa_helper.dart';
import '../utility/url_helper.dart';
import 'widgets/ace_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                elevation: 3.0,
                child: ListTile(
                  title: const Text('Sexual Assault Help'),
                  leading: FaIcon(
                    FaHelper.getIconFromName('ribbon'),
                    color: Colors.teal,
                  ),
                  onTap: () {
                    UrlHelper.makePhoneCall('8779955247');
                  },
                  trailing: const Icon(
                    Icons.phone,
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: Card(
                elevation: 3.0,
                child: ListTile(
                  title: const Text('Military Crisis Line'),
                  leading: FaIcon(
                    FaHelper.getIconFromName('crisis'),
                    color: Colors.red,
                  ),
                  trailing: const Icon(
                    Icons.phone,
                    color: Colors.red,
                  ),
                  onTap: () {
                    UrlHelper.makePhoneCall('8002738255');
                  },
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                      title: const Text('Welcome to Switchboard!'),
                      subtitle: Text(
                        'Your virtual patch panel to ...',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text(
                              '9',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Apps'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '13',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Hotlines'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '54',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Links'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '51',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Units'),
                          ],
                        ),
                      ],
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            UrlHelper.launchBrowser(
                                'https://www.resilience.af.mil/SAPR/Restricted-or-Unrestricted');
                            //https://www.resilience.af.mil/SAPR/Restricted-or-Unrestricted/
                          },
                          child: const Text(
                            'Learn more',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
            //   child: Card(
            //     elevation: 3.0,
            //     clipBehavior: Clip.antiAlias,
            //     child: Column(
            //       children: [
            //         ListTile(
            //           leading: CircleAvatar(
            //               backgroundColor: Colors.transparent,
            //               child: Image.asset(
            //                 'assets/images/resilience.png',
            //               )),
            //           title: const Text('My Engagement'),
            //           subtitle: Text(
            //             'Racking up resiliency points',
            //             style: TextStyle(color: Colors.black.withOpacity(0.6)),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Restricted vs Unrestricted',
                subTitle: 'What' 's the difference?',
                description:
                    'Deciding to report a sexual assault is a very personal decision. Restricted and unrestricted reporting options allow military members, dependents (18+) and DoD Air Force civilians who experience sexual assault to exercise control over how and when they engage with resources.',
                imageUrl: 'assets/images/teal_ribbon.jpeg',
                linkUrl:
                    'https://www.resilience.af.mil/SAPR/Restricted-or-Unrestricted/',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Suicide Warning Signs',
                subTitle: 'Do you know them?',
                description:
                    'Warning Signs for suicide are different than Risk Factors. They are more observable, and should be responded to immediately. A common theme for Warning Signs is change. This is why friends, relatives, and coworkers are critical in detecting early Warning Signs of distress.',
                imageUrl: 'assets/images/suicide_signs.jpeg',
                linkUrl:
                    'https://www.resilience.af.mil/suicide-prevention-program/',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Mental Health Counseling and Security Clearances',
                subTitle: 'Is there a negative impact?',
                description:
                    'Seeking mental health services does not affect one’s ability to gain or hold clearance eligibility. Adjudicators regard seeking necessary mental health treatment as a positive step in the security clearance process.',
                imageUrl: 'assets/images/pentagon.jpeg',
                linkUrl:
                    'https://www.dcsa.mil/Portals/91/Documents/pv/DODCAF/resources/DCSA-FactSheet_Mental-Health.pdf',
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: AceCard(),
            ),
          ],
        ),
      ),
    );
  }
}
