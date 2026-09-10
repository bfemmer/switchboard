import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AceCard extends StatelessWidget {
  const AceCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Row
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Container(
                    width: 44,
                    height: 44,
                    color: colorScheme.primaryContainer,
                    padding: const EdgeInsets.all(6),
                    child: Image.asset(
                      'assets/images/resilience.png',
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) => Icon(
                        Icons.shield_outlined,
                        color: colorScheme.primary,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'ACE Suicide Intervention Model',
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        'Ask • Care • Escort — Wingman Intervention Guide',
                        style: theme.textTheme.bodySmall?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 18),
            const Divider(height: 1),
            const SizedBox(height: 16),

            // Step 1: ASK
            _buildStepRow(
              context,
              stepNumber: '1',
              title: 'ASK Directly',
              description:
                  'Directly ask the individual if they are having thoughts of death, self-harm, or suicide. Ask calmly and without judgment.',
              icon: FontAwesomeIcons.circleQuestion,
              accentColor: Colors.teal,
            ),

            const SizedBox(height: 14),

            // Step 2: CARE
            _buildStepRow(
              context,
              stepNumber: '2',
              title: 'CARE & Listen',
              description:
                  'Care about their answer. Actively listen, validate their feelings, and remove any immediate means of self-harm if safe to do so.',
              icon: FontAwesomeIcons.handHoldingHeart,
              accentColor: Colors.red.shade700,
            ),

            const SizedBox(height: 14),

            // Step 3: ESCORT
            _buildStepRow(
              context,
              stepNumber: '3',
              title: 'ESCORT Immediately',
              description:
                  'Never leave them alone. Escort them directly to a chaplain, mental health professional, commander, or emergency room.',
              icon: FontAwesomeIcons.peoplePulling,
              accentColor: Colors.green.shade700,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepRow(
    BuildContext context, {
    required String stepNumber,
    required String title,
    required String description,
    required dynamic icon,
    required Color accentColor,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: accentColor.withAlpha(18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: accentColor.withAlpha(50),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: accentColor.withAlpha(35),
              shape: BoxShape.circle,
            ),
            child: FaIcon(
              icon,
              size: 18,
              color: accentColor,
            ),
          ),

          const SizedBox(width: 14),
          Expanded(
            child: Column(
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
                        color: accentColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        'STEP $stepNumber',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.5,
                        color: accentColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13,
                    height: 1.35,
                    color: colorScheme.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

