import 'package:flutter/material.dart';
import 'package:switchboard/core/utils/url_helper.dart';
import 'package:switchboard/features/home/data/datasources/resilience_tip_service.dart';
import 'package:switchboard/features/home/data/models/resilience_tip.dart';

class ResilienceTipCard extends StatefulWidget {
  const ResilienceTipCard({super.key});

  @override
  State<ResilienceTipCard> createState() => _ResilienceTipCardState();
}

class _ResilienceTipCardState extends State<ResilienceTipCard> {
  late int _currentWeek;
  late int _selectedWeek;
  List<ResilienceTip> _allTips = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _currentWeek = ResilienceTipService.instance.getWeekOfYear();
    _selectedWeek = _currentWeek;
    _loadTips();
  }

  Future<void> _loadTips() async {
    final tips = await ResilienceTipService.instance.getTips();
    if (mounted) {
      setState(() {
        _allTips = tips;
        _isLoading = false;
      });
    }
  }

  ResilienceTip? get _currentTip {
    if (_allTips.isEmpty) return null;
    final clamped = _selectedWeek.clamp(1, 52);
    return _allTips.firstWhere(
      (t) => t.weekNumber == clamped,
      orElse: () => _allTips[clamped - 1],
    );
  }

  void _nextWeek() {
    setState(() {
      if (_selectedWeek < 52) {
        _selectedWeek++;
      } else {
        _selectedWeek = 1; // loop around
      }
    });
  }

  void _prevWeek() {
    setState(() {
      if (_selectedWeek > 1) {
        _selectedWeek--;
      } else {
        _selectedWeek = 52; // loop around
      }
    });
  }

  void _resetToCurrentWeek() {
    setState(() {
      _selectedWeek = _currentWeek;
    });
  }

  Color _getDomainColor(String? domain) {
    switch (domain?.toLowerCase()) {
      case 'mental':
        return Colors.cyan.shade700;
      case 'physical':
        return Colors.green.shade700;
      case 'social':
        return Colors.indigo.shade600;
      case 'spiritual':
        return Colors.purple.shade700;
      case 'general':
      default:
        return Colors.deepOrange.shade700;
    }
  }

  IconData _getDomainIcon(String? domain) {
    switch (domain?.toLowerCase()) {
      case 'mental':
        return Icons.psychology_outlined;
      case 'physical':
        return Icons.fitness_center_outlined;
      case 'social':
        return Icons.people_outline;
      case 'spiritual':
        return Icons.explore_outlined;
      case 'general':
      default:
        return Icons.shield_outlined;
    }
  }

  String _formatPhone(String phone) {
    final digits = phone.replaceAll(RegExp(r'\D'), '');
    if (digits.length == 10) {
      return '(${digits.substring(0, 3)}) ${digits.substring(3, 6)}-${digits.substring(6)}';
    } else if (digits.length == 11 && digits.startsWith('1')) {
      return '1 (${digits.substring(1, 4)}) ${digits.substring(4, 7)}-${digits.substring(7)}';
    }
    return phone;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (_isLoading) {
      return Card(
        elevation: 1.5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: const Padding(
          padding: EdgeInsets.all(24.0),
          child: Center(child: CircularProgressIndicator()),
        ),
      );
    }

    final tip = _currentTip;
    if (tip == null) return const SizedBox.shrink();

    final domainColor = _getDomainColor(tip.domain);
    final domainIcon = _getDomainIcon(tip.domain);
    final isCurrentWeek = _selectedWeek == _currentWeek;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
        side: BorderSide(color: domainColor.withAlpha(60), width: 1.2),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Navigation Bar & Badges
            Wrap(
              alignment: WrapAlignment.spaceBetween,
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 8,
              runSpacing: 8,
              children: [
                // Badges Group
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    // Domain Chip
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: domainColor.withAlpha(25),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: domainColor.withAlpha(70)),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(domainIcon, size: 15, color: domainColor),
                          const SizedBox(width: 6),
                          Text(
                            (tip.domain ?? 'GENERAL').toUpperCase(),
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                              color: domainColor,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Week Badge
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: colorScheme.primary.withAlpha(20),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        isCurrentWeek
                            ? 'WEEK $_selectedWeek' // (THIS WEEK)'
                            : 'WEEK $_selectedWeek',
                        style: TextStyle(
                          fontSize: 10.5,
                          fontWeight: FontWeight.w700,
                          color: colorScheme.primary,
                          letterSpacing: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),

                // Controls Row
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Reset to Current Week button if different week
                    if (!isCurrentWeek)
                      IconButton(
                        tooltip: 'Return to Current Week',
                        visualDensity: VisualDensity.compact,
                        onPressed: _resetToCurrentWeek,
                        icon: Icon(
                          Icons.today_outlined,
                          size: 20,
                          color: colorScheme.primary,
                        ),
                      ),

                    // Prev / Next Week Controls
                    IconButton(
                      tooltip: 'Previous Week',
                      visualDensity: VisualDensity.compact,
                      onPressed: _prevWeek,
                      icon: const Icon(Icons.chevron_left, size: 22),
                    ),
                    IconButton(
                      tooltip: 'Next Week',
                      visualDensity: VisualDensity.compact,
                      onPressed: _nextWeek,
                      icon: const Icon(Icons.chevron_right, size: 22),
                    ),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Tip Title
            Text(
              tip.title ?? 'Resilience Tip',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                height: 1.25,
                color: colorScheme.onSurface,
              ),
            ),

            const SizedBox(height: 8),

            // Tip Action Text
            Text(
              tip.actionText ?? '',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                height: 1.45,
                fontSize: 13.5,
              ),
            ),

            // Optional Actions (Contact Phone / Link URL)
            if (tip.contactPhone != null || tip.linkUrl != null) ...[
              const SizedBox(height: 14),
              Wrap(
                spacing: 10,
                runSpacing: 8,
                children: [
                  if (tip.contactPhone != null && tip.contactPhone!.isNotEmpty)
                    FilledButton.icon(
                      onPressed: () {
                        UrlHelper.makePhoneCall(tip.contactPhone!);
                      },
                      icon: const Icon(Icons.phone, size: 14),
                      label: Text('Call ${_formatPhone(tip.contactPhone!)}'),
                      style: FilledButton.styleFrom(
                        backgroundColor: domainColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                  if (tip.linkUrl != null && tip.linkUrl!.isNotEmpty)
                    FilledButton.tonalIcon(
                      onPressed: () {
                        UrlHelper.launchBrowser(tip.linkUrl!);
                      },
                      icon: const Icon(Icons.open_in_new, size: 14),
                      label: const Text('Learn More'),
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        textStyle: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                        visualDensity: VisualDensity.compact,
                      ),
                    ),
                ],
              ),
            ],

            const SizedBox(height: 14),
            Divider(height: 1, color: colorScheme.outlineVariant.withAlpha(60)),
            const SizedBox(height: 8),

            // Bottom Footer: Browse All 52 Tips Modal Trigger
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    'Weekly resilience micro-actionable',
                    style: TextStyle(
                      fontSize: 11.5,
                      fontStyle: FontStyle.italic,
                      color: colorScheme.onSurfaceVariant.withAlpha(180),
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                InkWell(
                  borderRadius: BorderRadius.circular(8),
                  onTap: () => _showAllTipsModal(context),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'View All 52 Tips',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: colorScheme.primary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.grid_view_rounded,
                          size: 14,
                          color: colorScheme.primary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showAllTipsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      useSafeArea: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (modalContext) {
        return _AllTipsBottomSheet(
          allTips: _allTips,
          currentWeek: _currentWeek,
          selectedWeek: _selectedWeek,
          onSelectWeek: (weekNum) {
            setState(() {
              _selectedWeek = weekNum;
            });
            Navigator.pop(modalContext);
          },
        );
      },
    );
  }
}

class _AllTipsBottomSheet extends StatefulWidget {
  final List<ResilienceTip> allTips;
  final int currentWeek;
  final int selectedWeek;
  final ValueChanged<int> onSelectWeek;

  const _AllTipsBottomSheet({
    required this.allTips,
    required this.currentWeek,
    required this.selectedWeek,
    required this.onSelectWeek,
  });

  @override
  State<_AllTipsBottomSheet> createState() => _AllTipsBottomSheetState();
}

class _AllTipsBottomSheetState extends State<_AllTipsBottomSheet> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    final filteredTips = widget.allTips.where((tip) {
      if (_searchQuery.isEmpty) return true;
      final q = _searchQuery.toLowerCase();
      final title = (tip.title ?? '').toLowerCase();
      final action = (tip.actionText ?? '').toLowerCase();
      final domain = (tip.domain ?? '').toLowerCase();
      final weekStr = 'week ${tip.weekNumber}';
      return title.contains(q) ||
          action.contains(q) ||
          domain.contains(q) ||
          weekStr.contains(q);
    }).toList();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        children: [
          // Header handle
          const SizedBox(height: 12),
          Container(
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: colorScheme.onSurfaceVariant.withAlpha(80),
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(height: 12),

          // Title & Subtitle
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb_outline,
                  color: colorScheme.primary,
                  size: 24,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Resilience Tips (52 Weeks)',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Select a week to view its tip on the dashboard',
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),

          const SizedBox(height: 12),

          // Search Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              onChanged: (val) {
                setState(() {
                  _searchQuery = val;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search tips by keyword, domain, or week...',
                prefixIcon: const Icon(Icons.search, size: 20),
                isDense: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: colorScheme.outlineVariant),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 10,
                ),
              ),
            ),
          ),

          const SizedBox(height: 12),
          const Divider(height: 1),

          // List of Tips
          Expanded(
            child: ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: filteredTips.length,
              separatorBuilder: (context, index) => const SizedBox(height: 8),
              itemBuilder: (context, index) {
                final tip = filteredTips[index];
                final isCurrentWeek = tip.weekNumber == widget.currentWeek;
                final isSelectedWeek = tip.weekNumber == widget.selectedWeek;

                return Card(
                  elevation: isSelectedWeek ? 2 : 0.5,
                  color: isSelectedWeek
                      ? colorScheme.primaryContainer.withAlpha(60)
                      : null,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: isSelectedWeek
                        ? BorderSide(color: colorScheme.primary, width: 1.5)
                        : BorderSide(
                            color: colorScheme.outlineVariant.withAlpha(80),
                          ),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 6,
                    ),
                    onTap: () {
                      if (tip.weekNumber != null) {
                        widget.onSelectWeek(tip.weekNumber!);
                      }
                    },
                    leading: CircleAvatar(
                      radius: 18,
                      backgroundColor: isSelectedWeek
                          ? colorScheme.primary
                          : colorScheme.surfaceContainerHigh,
                      child: Text(
                        '${tip.weekNumber}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: isSelectedWeek
                              ? Colors.white
                              : colorScheme.onSurface,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Expanded(
                          child: Text(
                            tip.title ?? '',
                            style: TextStyle(
                              fontWeight: isSelectedWeek
                                  ? FontWeight.bold
                                  : FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ),
                        if (isCurrentWeek) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade100,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              'THIS WEEK',
                              style: TextStyle(
                                fontSize: 9.5,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade900,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        tip.actionText ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 12,
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    trailing: Icon(
                      isSelectedWeek ? Icons.check_circle : Icons.chevron_right,
                      color: isSelectedWeek
                          ? colorScheme.primary
                          : colorScheme.onSurfaceVariant,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
