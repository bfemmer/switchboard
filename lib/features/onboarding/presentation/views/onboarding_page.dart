import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:switchboard/features/onboarding/data/onboarding_preferences.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static String route() => '/onboarding';

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_OnboardingItem> _items = const [
    _OnboardingItem(
      title: 'Welcome to Switchboard',
      tag: 'COMPREHENSIVE RESILIENCE HUB',
      subtitle: 'Your Virtual Patch Panel to Resources',
      description:
          'Rapidly connect to 24/7 crisis hotlines, leadership quick guides, coping skills, and AFRC unit directories—all in one secure, offline library.',
      icon: Icons.shield_outlined,
      highlights: ['📞 24/7 Hotlines', '📋 Quick Guides', '🏛️ AFRC Units'],
      gradientColors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
      accentColor: Colors.lightBlueAccent,
    ),
    _OnboardingItem(
      title: 'Absolute Privacy & Safety',
      tag: '100% PRIVATE & ANONYMOUS',
      subtitle: 'Zero Logging. Zero Tracking. No Accounts.',
      description:
          'Switchboard does NOT capture, store, or track any personal data, searches, phone calls, or usage statistics. Your privacy is strictly guaranteed.',
      icon: Icons.security_outlined,
      highlights: [
        '🔒 No User Tracking',
        '🛡️ Anonymous Access',
        '🚫 No Sign-In',
      ],
      gradientColors: [Color(0xFF064E3B), Color(0xFF047857), Color(0xFF0F766E)],
      accentColor: Colors.tealAccent,
    ),
    _OnboardingItem(
      title: 'Ready Anytime, Anywhere',
      tag: '100% OFFLINE FIRST',
      subtitle: 'Local Directories & Transcripts',
      description:
          'Resource databases, video transcripts, crisis helplines, and unit phone numbers are stored locally on your device for instant access without cellular service.',
      icon: Icons.offline_bolt_outlined,
      highlights: ['⚡ Local Database', '📄 Offline Transcripts', '📱 Zero Lag'],
      // gradientColors: [Color(0xFF1E1B4B), Color(0xFF312E81), Color(0xFF4338CA)],
      // accentColor: Colors.indigoAccent,
      gradientColors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
      accentColor: Colors.lightBlueAccent,
    ),
    _OnboardingItem(
      title: 'One-Click Dialing & SMS',
      tag: 'INSTANT CRISIS SUPPORT',
      subtitle: '24/7 Confidential Helpline Access',
      description:
          'Direct 1-click dialing to the Military Crisis Line (988), DoD Safe Helpline, National Domestic Violence Hotline, installation Command Posts, and more.',
      icon: Icons.phone_in_talk_outlined,
      highlights: ['📞 1-Click Dialing', '💬 Text Support', '🌐 Web Portals'],
      gradientColors: [Color(0xFF0284C7), Color(0xFF0369A1), Color(0xFF075985)],
      accentColor: Colors.cyanAccent,
    ),
    _OnboardingItem(
      title: 'Build Everyday Resilience',
      tag: 'ACTIONABLE TOOLS & TIPS',
      subtitle: 'Tip of the Week, Skills & Guides',
      description:
          'Strengthen your mental, physical, social, and spiritual readiness with 52 weekly micro-actionables, coping strategies, and printable guides.',
      icon: Icons.lightbulb_outline,
      highlights: [
        '💡 Tip of the Week',
        '🧠 Coping Skills',
        '📄 Printable Guides',
      ],
      // gradientColors: [Color(0xFF7C2D12), Color(0xFF9A3412), Color(0xFFC2410C)],
      // accentColor: Colors.orangeAccent,
      gradientColors: [Color(0xFF0F2027), Color(0xFF203A43), Color(0xFF2C5364)],
      accentColor: Colors.lightBlueAccent,
    ),
  ];

  Future<void> _finishOnboarding() async {
    await OnboardingPreferences.setHasSeenOnboarding(true);
    if (mounted) {
      context.go('/home');
    }
  }

  void _nextPage() {
    if (_currentPage < _items.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeInOut,
      );
    } else {
      _finishOnboarding();
    }
  }

  @override
  Widget build(BuildContext context) {
    final item = _items[_currentPage];
    final isLastPage = _currentPage == _items.length - 1;

    return Scaffold(
      body: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: item.gradientColors,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Top Navigation Bar (Skip Button)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 12.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          Icons.settings_phone,
                          color: Colors.white70,
                          size: 22,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'Switchboard',
                          style: TextStyle(
                            color: Colors.white.withAlpha(220),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ],
                    ),
                    TextButton(
                      onPressed: _finishOnboarding,
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white.withAlpha(200),
                      ),
                      child: const Text(
                        'SKIP',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Page View for Slides
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _items.length,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemBuilder: (context, index) {
                    final slide = _items[index];
                    return _buildSlide(slide);
                  },
                ),
              ),

              // Bottom Bar: Indicators & Next/Get Started Button
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Dot Indicators
                    Row(
                      children: List.generate(_items.length, (index) {
                        final isSelected = index == _currentPage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(right: 6),
                          height: 8,
                          width: isSelected ? 26 : 8,
                          decoration: BoxDecoration(
                            color: isSelected
                                ? item.accentColor
                                : Colors.white.withAlpha(80),
                            borderRadius: BorderRadius.circular(4),
                          ),
                        );
                      }),
                    ),

                    // Action Button
                    ElevatedButton(
                      onPressed: _nextPage,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: item.accentColor,
                        foregroundColor: Colors.black87,
                        padding: EdgeInsets.symmetric(
                          horizontal: isLastPage ? 24 : 20,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 4,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            isLastPage ? 'GET STARTED' : 'NEXT',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              letterSpacing: 0.8,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            isLastPage
                                ? Icons.arrow_forward_rounded
                                : Icons.chevron_right_rounded,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSlide(_OnboardingItem slide) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 28.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 20),

          // Glowing Icon Container
          Container(
            padding: const EdgeInsets.all(28),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: slide.accentColor.withAlpha(35),
              border: Border.all(
                color: slide.accentColor.withAlpha(100),
                width: 2,
              ),
              boxShadow: [
                BoxShadow(
                  color: slide.accentColor.withAlpha(40),
                  blurRadius: 30,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Icon(slide.icon, size: 72, color: Colors.white),
          ),

          const SizedBox(height: 36),

          // Tag Chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            decoration: BoxDecoration(
              color: slide.accentColor.withAlpha(40),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: slide.accentColor.withAlpha(80)),
            ),
            child: Text(
              slide.tag,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: slide.accentColor,
              ),
            ),
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            slide.title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              height: 1.2,
            ),
          ),

          const SizedBox(height: 8),

          // Subtitle
          Text(
            slide.subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: slide.accentColor,
            ),
          ),

          const SizedBox(height: 16),

          // Description Body
          Text(
            slide.description,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 14.5,
              color: Colors.white.withAlpha(220),
              height: 1.45,
            ),
          ),

          const SizedBox(height: 28),

          // Highlights Chips
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: slide.highlights.map((h) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withAlpha(20),
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.white.withAlpha(40)),
                ),
                child: Text(
                  h,
                  style: const TextStyle(
                    fontSize: 12.5,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              );
            }).toList(),
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _OnboardingItem {
  final String title;
  final String tag;
  final String subtitle;
  final String description;
  final IconData icon;
  final List<String> highlights;
  final List<Color> gradientColors;
  final Color accentColor;

  const _OnboardingItem({
    required this.title,
    required this.tag,
    required this.subtitle,
    required this.description,
    required this.icon,
    required this.highlights,
    required this.gradientColors,
    required this.accentColor,
  });
}
