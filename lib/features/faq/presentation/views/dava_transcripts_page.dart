import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:switchboard/core/router/nav_scaffold.dart';
import 'package:switchboard/core/utils/url_helper.dart';

class DavaTranscriptItem {
  final int id;
  final String question;
  final String category;
  final String summary;
  final String transcript;
  final String? videoUrl;
  final String? pdfUrl;

  const DavaTranscriptItem({
    required this.id,
    required this.question,
    required this.category,
    required this.summary,
    required this.transcript,
    this.videoUrl,
    this.pdfUrl,
  });
}

class DavaTranscriptsPage extends StatefulWidget {
  const DavaTranscriptsPage({super.key});

  static String route() => "/dava-transcripts";

  @override
  State<DavaTranscriptsPage> createState() => _DavaTranscriptsPageState();
}

class _DavaTranscriptsPageState extends State<DavaTranscriptsPage> {
  String _selectedCategory = 'All';
  String _searchQuery = '';

  static const List<DavaTranscriptItem> _transcripts = [
    DavaTranscriptItem(
      id: 1,
      category: 'Support & Services',
      question:
          'How can a Domestic Abuse Victim Advocate (DAVA) help if I’m experiencing abuse?',
      summary:
          'DAVAs provide 24/7 confidential support, risk assessment, safety planning, and connections to medical care, counseling, and legal resources.',
      transcript:
          'For those experiencing domestic abuse, support is available and you will never have to face a situation alone. Abuse can affect anyone, and Family Advocacy Program staff can help.\n\n'
          'Victim advocates offer assistance to include safety planning and risk assessment during times of need, and are a trusted first line of information. Counseling and medical care may also be available. You will never be forced to share more than you are comfortable with.\n\n'
          'Key Ways DAVAs Assist:\n'
          '• Safety Planning: Personalized safety strategies for home, work, and military housing.\n'
          '• Explaining Options: Clarifying restricted vs. unrestricted reporting choices clearly without pressure.\n'
          '• Resource Connections: Direct links to medical treatment, clinical counseling, legal aid, and emergency shelter.\n'
          '• Continuous Advocacy: Accompanying victims through medical appointments, command briefings, or legal proceedings.',
      videoUrl: 'https://www.youtube.com/watch?v=qdKGA79Gsdo',
      pdfUrl:
          'https://download.militaryonesource.mil/12038/MOS/FAP/video-transcript-how-can-an-advocate-help.pdf',
    ),
    DavaTranscriptItem(
      id: 2,
      category: 'Reporting Options',
      question:
          'What are my options for reporting domestic abuse in the military?',
      summary:
          'Deciding if, when, or how to report domestic abuse is not easy. The military offers two distinct reporting pathways: Restricted and Unrestricted.',
      transcript:
          'Deciding if, when or how to report domestic abuse is not easy. But support is available. There are two ways to make a report of domestic abuse in the military: restricted and unrestricted. To learn more about reporting options, whether you are experiencing abuse or know someone who is, connect with a nearby advocate.\n\n'
          '• Restricted Reporting: Allows victims to confidentially receive support, medical care, and counseling without triggering an official investigation or command notification.\n'
          '• Unrestricted Reporting: Involves command notification and law enforcement investigation while providing full medical, counseling, and legal protection resources.',
      videoUrl: 'https://www.youtube.com/watch?v=FwrXlB12m2s',
      pdfUrl:
          'https://download.militaryonesource.mil/12038/MOS/FAP/video-transcript-options-for-reporting-domestic-abuse.pdf',
    ),
    DavaTranscriptItem(
      id: 3,
      category: 'Reporting Options',
      question: 'What is a restricted report of domestic abuse?',
      summary:
          'Restricted reporting lets victims receive medical care, advocacy, and counseling confidentially without command or law enforcement notification.',
      transcript:
          'Choosing to report domestic abuse can be difficult. But knowing what to expect can help. In the military, there are two reporting options: restricted and unrestricted. This video is about restricted reporting. For those seeking to address their situation privately, a restricted report could be an option.\n\n'
          'Key Features of Restricted Reporting:\n'
          '• Complete Confidentiality: Command and military law enforcement are NOT notified.\n'
          '• Authorized Personnel: Can be initiated with a Domestic Abuse Victim Advocate (DAVA), FAP clinician, or military healthcare provider.\n'
          '• Flexibility: Victims retain the option to convert a restricted report to an unrestricted report at any time if they choose.',
      videoUrl: 'https://www.youtube.com/watch?v=l-AWB6TiUtk',
      pdfUrl:
          'https://download.militaryonesource.mil/12038/MOS/FAP/video-transcript-restricted-report-of-domestic-abuse.pdf',
    ),
    DavaTranscriptItem(
      id: 4,
      category: 'Reporting Options',
      question: 'What is an unrestricted report of domestic abuse?',
      summary:
          'Unrestricted reporting provides comprehensive medical, counseling, and advocacy support while notifying command and law enforcement to investigate.',
      transcript:
          'Unrestricted reporting offers victims safety planning, clinical counseling and medical care, and notifies a service member’s command and the appropriate law enforcement organizations of the incident for a potential investigation. An alleged abuser will also be provided with services when there is an unrestricted report.\n\n'
          'Key Features of Unrestricted Reporting:\n'
          '• Protection Orders: Enables command to issue Military Protection Orders (MPOs) or separate work schedules.\n'
          '• Formal Investigation: Military or civilian law enforcement investigates the report.\n'
          '• Full Support: Access to all victim advocacy, medical, legal, and counseling services.',
      videoUrl: 'https://www.youtube.com/watch?v=x7NLbs1DhVY',
      pdfUrl:
          'https://download.militaryonesource.mil/12038/MOS/FAP/video-transcript-unrestricted-report-of-domestic-abuse.pdf',
    ),
    DavaTranscriptItem(
      id: 5,
      category: 'Reporting Options',
      question:
          'What happens when an unrestricted report of domestic abuse is made?',
      summary:
          'Details the step-by-step process following an unrestricted report, including law enforcement investigation, command involvement, and protective measures.',
      transcript:
          'When an unrestricted report is made about an incident that has occurred on a military installation, military law enforcement may investigate and contact the alleged abuser.\n\n'
          'Command becomes involved and can offer resources for protection, which may include a military protection order. Similar services are available when an incident occurs off a military installation. Full access to services is also provided, including help from a victim advocate, medical care and counseling.',
      videoUrl: 'https://www.youtube.com/watch?v=18CQIyt4Dds',
      pdfUrl:
          'https://download.militaryonesource.mil/12038/MOS/FAP/video-transcript-unrestricted-report-of-domestic-abuse-process.pdf',
    ),
    DavaTranscriptItem(
      id: 6,
      category: 'Support & Services',
      question: 'What if I’m concerned about my behavior in my relationship?',
      summary:
          'Reaching out before abuse happens is vital. FAP provides counseling and behavioral support for individuals noticing harmful relationship patterns.',
      transcript:
          'The best time to reach out for help is before abuse happens. When harmful patterns emerge in interactions with a partner, contact the Family Advocacy Program for support.\n\n'
          'FAP offers proactive, non-judgmental assistance including relationship education, conflict resolution coaching, stress management, and counseling to help service members and spouses build healthy, safe dynamics.',
      videoUrl: 'https://www.youtube.com/watch?v=3a1e68lrrYY',
      pdfUrl:
          'https://download.militaryonesource.mil/12038/MOS/FAP/video-transcript-concerned-about-my-behavior.pdf',
    ),
    DavaTranscriptItem(
      id: 7,
      category: 'Safety & Privacy',
      question:
          'What should I know about protecting my privacy while browsing the internet?',
      summary:
          'Digital and technology abuse can occur through tracking devices, shared accounts, or monitored browsing history. Learn key safe browsing steps.',
      transcript:
          'Most of us use smartphones and computers without thinking about safe internet browsing, but every online interaction leaves a trail others can track. If you suspect your partner is monitoring your online activity, you might be right.\n\n'
          'Technology abuse can include access to private information, control over online accounts, or tracking location through mobile devices.\n\n'
          'Key Safe Browsing Tips:\n'
          '1. Use a computer or device your partner does not have access to (e.g. library or trusted friend’s phone).\n'
          '2. Change passwords and PINs on unmonitored devices.\n'
          '3. Clear your browser history, search history, and cache after reading sensitive resources.\n'
          '4. Check smartphone location sharing settings and connected accounts.',
    ),
    DavaTranscriptItem(
      id: 8,
      category: 'Safety & Privacy',
      question:
          'How can pets be used as a form of control, and what resources exist to keep them safe?',
      summary:
          'Abusive partners may use threats against pets to manipulate or control. Guidance and pet safety networks help protect family animals.',
      transcript:
          'Our pets provide us with great comfort, cuddles and company. They offer and inspire unconditional love. Unfortunately, that love between a family and a pet may be used by an abusive partner to inflict emotional abuse, manipulate and control their partner.\n\n'
          'Pet Safety Steps:\n'
          '• Keep medical and ownership records (vaccines, licenses, microchips) accessible.\n'
          '• DAVAs can assist with connecting to pet shelter networks (such as Purple Leash Project or Red Rover) so you and your pet reach safety together.',
    ),
    DavaTranscriptItem(
      id: 9,
      category: 'Support & Services',
      question:
          'Am I eligible for transitional compensation if I experienced abuse while my spouse was on active duty?',
      summary:
          'Transitional Compensation provides temporary financial payments, medical benefits, and commissary privileges to dependent victims of abuse.',
      transcript:
          'Transitional compensation is a temporary resource that provides financial support and other help to dependent victims of abuse. If you are a military spouse or active-duty spouse, and your service member spouse has been separated from the service due to domestic or child abuse, you may be eligible for this resource.\n\n'
          'Benefits under Transitional Compensation:\n'
          '• Monthly financial support payments.\n'
          '• TRICARE medical care and pharmacy benefits.\n'
          '• Commissary and Exchange privileges for up to 36 months.',
    ),
  ];

  List<String> get _categories => [
    'All',
    'Reporting Options',
    'Support & Services',
    'Safety & Privacy',
  ];

  List<DavaTranscriptItem> get _filteredTranscripts {
    return _transcripts.where((item) {
      final matchesCategory =
          _selectedCategory == 'All' || item.category == _selectedCategory;
      final matchesSearch =
          _searchQuery.isEmpty ||
          item.question.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.transcript.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.summary.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesCategory && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('DAVA FAQs'),
        elevation: 0,
        actions: buildAppBarActions(context),
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 16.0,
                    ),
                    children: [
                      // Hero Banner Card
                      _buildHeroBanner(context, colorScheme),

                      const SizedBox(height: 16),

                      // Search Bar
                      TextField(
                        onChanged: (val) => setState(() => _searchQuery = val),
                        decoration: InputDecoration(
                          hintText: 'Search transcripts & FAQs...',
                          prefixIcon: const Icon(Icons.search),
                          suffixIcon: _searchQuery.isNotEmpty
                              ? IconButton(
                                  icon: const Icon(Icons.clear),
                                  onPressed: () =>
                                      setState(() => _searchQuery = ''),
                                )
                              : null,
                          filled: true,
                          fillColor: colorScheme.surfaceContainerHigh.withAlpha(
                            120,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Category Chips Bar
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: _categories.map((cat) {
                            final isSelected = cat == _selectedCategory;
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: ChoiceChip(
                                label: Text(cat),
                                selected: isSelected,
                                onSelected: (sel) {
                                  if (sel) {
                                    setState(() => _selectedCategory = cat);
                                  }
                                },
                                selectedColor: colorScheme.primary,
                                labelStyle: TextStyle(
                                  color: isSelected
                                      ? colorScheme.onPrimary
                                      : colorScheme.onSurfaceVariant,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 12.5,
                                ),
                                backgroundColor: colorScheme.surface,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  side: BorderSide(
                                    color: isSelected
                                        ? Colors.transparent
                                        : colorScheme.outlineVariant,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),

                      const SizedBox(height: 16),

                      // Transcripts List
                      _filteredTranscripts.isEmpty
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 40.0,
                              ),
                              child: Column(
                                children: [
                                  Icon(
                                    Icons.search_off_rounded,
                                    size: 56,
                                    color: colorScheme.onSurfaceVariant
                                        .withAlpha(100),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    'No transcripts match your search.',
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: colorScheme.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            )
                          : ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: _filteredTranscripts.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 12.0),
                                  child: _buildTranscriptCard(
                                    context,
                                    _filteredTranscripts[index],
                                    index,
                                  ),
                                );
                              },
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroBanner(BuildContext context, ColorScheme colorScheme) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.surfaceContainerHigh,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(15),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorScheme.primary.withAlpha(35),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    'OFFLINE FAP VIDEO OVERVIEWS & FAQS',
                    style: TextStyle(
                      fontSize: 10.5,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.9,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'DAVA Video Transcripts',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Complete offline text transcripts for all Domestic Abuse Victim Advocate (DAVA) videos and FAQs.',
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    height: 1.35,
                  ),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    _buildTagChip(context, '100% Offline Access', Colors.teal),
                    _buildTagChip(
                      context,
                      'Restricted vs Unrestricted',
                      Colors.indigo,
                    ),
                    _buildTagChip(context, 'Safety & Privacy', Colors.purple),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              color: Colors.teal.withAlpha(30),
              shape: BoxShape.circle,
            ),
            child: const FaIcon(
              FontAwesomeIcons.shieldHeart,
              size: 38,
              color: Colors.teal,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTagChip(BuildContext context, String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withAlpha(25),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withAlpha(70)),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildTranscriptCard(
    BuildContext context,
    DavaTranscriptItem item,
    int index,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 1.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: colorScheme.outlineVariant.withAlpha(80),
          width: 1.0,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Theme(
        data: theme.copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          tilePadding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 10.0,
          ),
          childrenPadding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 16.0,
          ),
          leading: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.teal.withAlpha(25),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.description_outlined,
              size: 22,
              color: Colors.teal,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.primary.withAlpha(20),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 9.5,
                        fontWeight: FontWeight.bold,
                        color: colorScheme.primary,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              Text(
                item.question,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  height: 1.25,
                ),
              ),
            ],
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 6.0),
            child: Text(
              item.summary,
              style: TextStyle(
                fontSize: 12.5,
                color: colorScheme.onSurfaceVariant,
                height: 1.3,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          children: [
            const Divider(height: 1),
            const SizedBox(height: 14),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(14.0),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerHigh.withAlpha(100),
                borderRadius: BorderRadius.circular(12),
              ),
              child: SelectableText(
                item.transcript,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurface,
                  height: 1.45,
                  fontSize: 13.5,
                ),
              ),
            ),
            const SizedBox(height: 14),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.end,
              children: [
                if (item.videoUrl != null)
                  OutlinedButton.icon(
                    onPressed: () => UrlHelper.launchBrowser(item.videoUrl!),
                    icon: const Icon(Icons.play_circle_outline, size: 16),
                    label: const Text('Watch Video'),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                if (item.pdfUrl != null)
                  OutlinedButton.icon(
                    onPressed: () => UrlHelper.launchBrowser(item.pdfUrl!),
                    icon: const Icon(Icons.picture_as_pdf_outlined, size: 16),
                    label: const Text('Download PDF'),
                    style: OutlinedButton.styleFrom(
                      visualDensity: VisualDensity.compact,
                    ),
                  ),
                IconButton.filledTonal(
                  tooltip: 'Share Transcript',
                  onPressed: () => _shareTranscript(item),
                  icon: const Icon(Icons.share_outlined, size: 18),
                  style: IconButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _shareTranscript(DavaTranscriptItem item) {
    String subject = 'DAVA Transcript: ${item.question}';
    String body =
        '${item.question}\n\n${item.transcript}\n\nShared via Switchboard App';
    UrlHelper.sendEmail(subject, body);
  }
}
