import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/home/presentation/widgets/left_image_card.dart';
import 'package:switchboard/features/home/presentation/widgets/video_section.dart';
import 'package:switchboard/features/resources/presentation/viewmodels/resource_viewmodel.dart';

class ResponsiveHomeBody extends StatelessWidget {
  final ResourceViewModel viewModel;

  const ResponsiveHomeBody({super.key, required this.viewModel});

  @override
  Widget build(BuildContext context) {
    // Center the content for Desktop so it doesn't stretch too wide
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxWidth: 1000,
        ), // Max width for Desktop
        child: ListView(
          padding: const EdgeInsets.only(bottom: 40),
          children: [
            // Header Image
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
              child: Image.asset('assets/images/a10.png'),
            ),

            // Network Guide Link
            _buildLinkCard(
              context,
              title: 'Connect the Network Guide',
              subtitle: 'AFRC/A1Z',
              description:
                  'Printable guide of resources (and the original source and inspiration for this app).',
              image: 'assets/images/network_alpha.png',
              url:
                  'https://billfemmer.gitlab.io/switchboard-support/Connect_the_Network_Guide_March2025.pdf',
            ),

            const SizedBox(height: 25),

            // FAP Section (Auto-adapts layout)
            VideoSection(
              title: 'Family Advocacy Program (FAP)',
              videos: viewModel.fapVideos,
            ),

            // DAVA Link
            _buildLinkCard(
              context,
              title: 'DAVA Locator',
              subtitle: 'Domestic Abuse Victim Advocate',
              description:
                  'Find your nearest DAVA who can help with explaining options, assessing risk, & developing safety plans.',
              image: 'assets/images/dava.png',
              url:
                  'https://www.militaryonesource.mil/resources/tools/domestic-abuse-victim-advocate-locator',
            ),

            const SizedBox(height: 25),

            // Reserve Ready Section
            VideoSection(title: 'Reserve Ready', videos: viewModel.readyVideos),

            // Units Link
            _buildLinkCard(
              context,
              title: 'Reserve Units',
              subtitle: 'AFRC',
              description:
                  'List of AFRC units for unit-specific resources including websites and  phone numbers.',
              image: 'assets/images/afrc1024.png',
              onTap: () => context.push('/units'),
            ),

            const SizedBox(height: 25),

            // CAN Section
            VideoSection(
              title: 'Community Action Network',
              videos: viewModel.canVideos,
            ),

            // Quick Guides
            _buildLinkCard(
              context,
              title: 'Leadership Resources',
              subtitle: 'Resilience Quick Guides',
              description:
                  'Collection of  guides covering medical, mental health, family, career, work, and safety.',
              image: 'assets/images/resilience.png',
              onTap: () => context.push('/guides'),
            ),

            // Chill drill tools
            VideoSection(title: 'Tools', videos: viewModel.toolsVideos),
          ],
        ),
      ),
    );
  }

  // Helper to keep the main build method clean
  Widget _buildLinkCard(
    BuildContext context, {
    required String title,
    required String subtitle,
    required String image,
    required String description,
    String? url,
    VoidCallback? onTap,
  }) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 500),
        child: InkWell(
          onTap: onTap ?? () => UrlHelper.launchBrowser(url!),
          child: LeftImageCard(
            imageUrl: image,
            title: title,
            subtitle: subtitle,
            description: description, // Add description if needed
            flex: 2,
          ),
        ),
      ),
    );
  }
}
