import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utility/fa_helper.dart';
import '../utility/url_helper.dart';

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
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
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
                          radius: 25,
                          child: Image.asset(
                            'assets/images/usaf_roundel.png',
                          )),
                      title: const Text('Restricted vs Unrestricted'),
                      subtitle: Text(
                        'What' 's the difference?',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Image.asset('assets/images/teal_ribbon.jpeg'),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                        'Deciding to report a sexual assault is a very personal decision. Restricted and Unrestricted reporting options allow military members, dependents (18+) and DoD Air Force civilians who experienced sexual assault to exercise control over how and when they engage with resources.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
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
                          radius: 25,
                          child: Image.asset(
                            'assets/images/usaf_roundel.png',
                          )),
                      title: const Text('Suicide Warning Signs'),
                      subtitle: Text(
                        'Do you know them?',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Image.asset('assets/images/suicide_signs.jpeg'),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                        'Warning Signs for suicide are different than Risk Factors. They are more observable, and should be responded to immediately. A common theme for Warning Signs is change. This is why friends, relatives, and coworkers are critical in detecting early Warning Signs of distress.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            UrlHelper.launchBrowser(
                                'https://www.resilience.af.mil/suicide-prevention-program/');
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
                          radius: 25,
                          child: Image.asset(
                            'assets/images/usaf_roundel.png',
                          )),
                      title: const Text(
                          'Mental Health Counseling and Security Clearances'),
                      subtitle: Text(
                        'Is there any negative impact?',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    Image.asset('assets/images/pentagon.jpeg'),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                      child: Text(
                        'Seeking mental health services does not affect one’s ability to gain or hold clearance eligibility. Adjudicators regard seeking necessary mental health treatment as a positive step in the security clearance process.',
                        style: TextStyle(color: Colors.black.withOpacity(0.6)),
                      ),
                    ),
                    ButtonBar(
                      alignment: MainAxisAlignment.start,
                      children: [
                        TextButton(
                          onPressed: () {
                            UrlHelper.launchBrowser(
                                'https://www.dcsa.mil/Portals/91/Documents/pv/DODCAF/resources/DCSA-FactSheet_Mental-Health.pdf');
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
          ],
        ),
      ),
    );
  }
}
