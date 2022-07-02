import 'package:flutter/material.dart';

import '../utility/url_helper.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'Quick access emergency phone numbers',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.red),
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          UrlHelper.makePhoneCall('911');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          elevation: 8,
                          padding: const EdgeInsets.all(20),
                          primary: Colors.red, // <-- Button color
                          onPrimary: Colors.blue, // <-- Splash color
                        ),
                        child: const Icon(Icons.call, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text('911'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          UrlHelper.makePhoneCall('8779955247');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          elevation: 8,
                          padding: const EdgeInsets.all(20),
                          primary: Colors.teal, // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                        child: const Icon(Icons.call, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text('Sexual Assault'),
                    ],
                  ),
                  Column(
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          UrlHelper.makePhoneCall('8002738255');
                        },
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),
                          elevation: 8,
                          padding: const EdgeInsets.all(20),
                          primary: Colors.purple, // <-- Button color
                          onPrimary: Colors.red, // <-- Splash color
                        ),
                        child: const Icon(Icons.call, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      const Text('Crisis Line'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
