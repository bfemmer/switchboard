import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/home/data/models/feed.dart';
import 'package:switchboard/features/home/presentation/widgets/left_image_card.dart';
import 'package:switchboard/features/home/presentation/widgets/video_card.dart';
import 'package:switchboard/features/resources/data/models/video.dart';

class HomeMobileView extends StatefulWidget {
  const HomeMobileView({
    required this.feed,
    super.key,
    required this.canVideos,
    required this.readyVideos,
    required this.fapVideos,
  });

  final List<Feed> feed;
  final List<Video> fapVideos;
  final List<Video> canVideos;
  final List<Video> readyVideos;

  @override
  State<HomeMobileView> createState() => _HomeMobileViewState();
}

class _HomeMobileViewState extends State<HomeMobileView> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20, right: 20),
            child: Image.asset('assets/images/a10.png'),
          ),
          InkWell(
            onTap: () {
              UrlHelper.launchBrowser(
                'https://billfemmer.gitlab.io/switchboard-support/Connect_the_Network_Guide_March2025.pdf',
              );
            },
            child: LeftImageCard(
              imageUrl: 'assets/images/network_alpha.png',
              title: 'Connect the Network Guide',
              subtitle: 'AFRC/A1Z',
              description:
                  'Printable guide of resources (and the original source and inspiration for this app).',
              flex: 2,
            ),
          ),

          SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Family Advocacy Program (FAP)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 230, // Set a fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Key for horizontal scrolling
              itemCount: widget.fapVideos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    UrlHelper.launchBrowser(
                      'https://www.youtube.com/watch?v=${widget.fapVideos[index].url!}',
                    );
                  },
                  child: VideoCard(video: widget.fapVideos[index]),
                );
              },
            ),
          ),
          // SizedBox(height: 25),
          InkWell(
            onTap: () {
              UrlHelper.launchBrowser(
                'https://www.militaryonesource.mil/resources/tools/domestic-abuse-victim-advocate-locator',
              );
            },
            child: LeftImageCard(
              imageUrl: 'assets/images/dava.png',
              title: 'DAVA Locator (Military OneSource)',
              subtitle: 'Domestic Abuse Victim Advocate',
              description:
                  'Find contact info for your nearest DAVA who can help with explaining options, assessing risk, & developing safety plans.',
              flex: 5,
            ),
          ),

          // const Padding(
          //   padding: EdgeInsets.only(left: 16, right: 16),
          //   child: Align(
          //     alignment: AlignmentGeometry.centerLeft,
          //     child: Text(
          //       'Highlights',
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // SizedBox(
          //   height: 200, // Set a fixed height for the horizontal list
          //   child: ListView.builder(
          //     scrollDirection: Axis.horizontal, // Key for horizontal scrolling
          //     itemCount: widget.feed.length,
          //     itemBuilder: (context, index) {
          //       return VideoCard(feed: widget.feed[index]);
          //     },
          //   ),
          // ),
          // SizedBox(height: 25),
          // const Padding(
          //   padding: EdgeInsets.only(left: 16, right: 16),
          //   child: Align(
          //     alignment: AlignmentGeometry.centerLeft,
          //     child: Text(
          //       'Unit of the Week',
          //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          //     ),
          //   ),
          // ),
          // LeftImageCard(
          //   imageUrl: 'assets/images/b52.jpeg',
          //   title: '919th Special Operations Wing',
          //   subtitle: 'Duke Field, FL',
          //   description:
          //       'The Quiet Professionals at Duke Field serve as the nation\'s only Air Cmmandos in AFRC.',
          //   onCallToAction: null,
          //   callToActionText: '',
          // ),
          SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Reserve Ready (Video Series)',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 230, // Set a fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Key for horizontal scrolling
              itemCount: widget.readyVideos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    UrlHelper.launchBrowser(
                      'https://www.youtube.com/watch?v=${widget.readyVideos[index].url!}',
                    );
                  },
                  child: VideoCard(video: widget.readyVideos[index]),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              context.push('/units');
            },
            child: LeftImageCard(
              imageUrl: 'assets/images/afrc1024.png',
              title: 'Reserve Units',
              subtitle: 'AFRC',
              description:
                  'Browse a list of AFRC units for unit-specific resources including websites and  phone numbers.',
              flex: 2,
            ),
          ),
          SizedBox(height: 25),
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Align(
              alignment: AlignmentGeometry.centerLeft,
              child: Text(
                'Community Action Network',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 230, // Set a fixed height for the horizontal list
            child: ListView.builder(
              scrollDirection: Axis.horizontal, // Key for horizontal scrolling
              itemCount: widget.canVideos.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    UrlHelper.launchBrowser(
                      'https://www.youtube.com/watch?v=${widget.canVideos[index].url!}',
                    );
                  },
                  child: VideoCard(video: widget.canVideos[index]),
                );
              },
            ),
          ),
          InkWell(
            onTap: () {
              context.push('/guides');
            },
            child: LeftImageCard(
              imageUrl: 'assets/images/resilience.png',
              title: 'Leadership Resources ',
              subtitle: 'Resilience Quick Guides',
              description:
                  'Collection of  guides covering medical, mental health, family, career, work, and safety.',
              flex: 2,
            ),
          ),
        ],
      ),
    );

    // return Scaffold(
    //   body: SafeArea(
    //     child: ListView.builder(
    //       itemCount: widget.feed.length,
    //       itemBuilder: (context, index) {
    //         return Padding(
    //           padding: const EdgeInsets.only(left: 10, right: 10),
    //           child: MediaCard(
    //             title: widget.feed[index].title!,
    //             subTitle: widget.feed[index].subtitle!,
    //             description: widget.feed[index].description!,
    //             linkUrl: null,
    //             imageUrl: 'assets/images/operators.png',
    //             // linkUrl: widget.feed[index].linkUrl,
    //             // imageUrl: widget.feed[index].imageUrl!,
    //           ),
    //         );
    //       },
    //     ),
    //   ),
    // );
  }
}
