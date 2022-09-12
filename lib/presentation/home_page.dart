import 'package:flutter/material.dart';
import 'package:switchboard/presentation/widgets/media_card.dart';

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
                title: 'Welcome to Switchboard!',
                subTitle: 'Your virtual patch panel to resources',
                description:
                    'Resiliency Switchboard is a companion app to the AFRC Connect the Network Guide as well as to the USAF resiliency website and was initially designed for Resiliency Integrators and First Sergeants in AFRC; however, the app is equally useful across the total force and can be used by Airmen up and down the chain of command.',
                imageUrl: 'assets/images/operators_feed.png',
                linkUrl:
                    'https://www.resilience.af.mil/SAPR/Restricted-or-Unrestricted/',
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
                      title: const Text('Switchboard By The Numbers'),
                      subtitle: Text(
                        'This version provides access to ...',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
                            Text(
                              '10',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Apps'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '14',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Hotlines'),
                          ],
                        ),
                        Column(
                          children: const [
                            Text(
                              '100',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text('Resources'),
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
