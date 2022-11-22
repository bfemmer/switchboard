import 'package:flutter/material.dart';
import 'package:switchboard/presentation/widgets/media_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: const [
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Welcome to Switchboard!',
                subTitle: 'Your resiliency patch panel operator',
                description:
                    'Resiliency Switchboard is a companion app to the AFRC Connect the Network Guide as well as to the USAF resiliency website and was initially designed for Resiliency Integrators and First Sergeants in AFRC; however, the app is equally useful to First Sergeants across the total force and can also be used by all Airmen up and down the ranks across the total force.',
                imageUrl: 'assets/images/operators_feed.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Airmen\'s Time',
                subTitle: 'Make it a part of our duty day',
                description:
                    'Airmen\'s Time is spending time together on a regular basis and talking about things that matter outside of our mission. It\'s increasing connection among military and civilian Airmen. Connection to others is a predictor of how well we move through stress or challenges. Connection is more than knowing each other ... it\'s about building trust and cohesion.',
                imageUrl: 'assets/images/airmens_time.jpeg',
                linkUrl:
                    'https://www.resilience.af.mil/Portals/71/Airmen%27s%20Time%20Memo.pdf',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Self Care',
                subTitle: 'You can\'t pour from an empty cup',
                description:
                    'Continual exposure to stress can cause us to burnout. Though stress may often times be unavoidable, burnout is preventable. At a time when it feels like so much is out of our control, it\'s important to recognize and focus on what you can change/control and utilize self-care resources and techniques to keep your battery charged.',
                imageUrl: 'assets/images/battery.jpg',
                linkUrl:
                    'https://www.militaryonesource.mil/military-life-cycle/friends-extended-family/taking-care-of-yourself-to-overcome-stress-grief/',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
              child: MediaCard(
                title: 'Restricted vs Unrestricted',
                subTitle: 'What' 's the difference?',
                description:
                    'Deciding to report a sexual assault is a very personal decision. Restricted and unrestricted reporting options allow military members, dependents (18+) and DoD Air Force civilians who experience sexual assault to exercise control over how and when they engage with resources.',
                imageUrl: 'assets/images/teal_ribbon.jpeg',
                linkUrl: 'https://www.sapr.mil/reporting-options',
              ),
            ),
            Padding(
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
            Padding(
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
          ],
        ),
      ),
    );
  }
}
