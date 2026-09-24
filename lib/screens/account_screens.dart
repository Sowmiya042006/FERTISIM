import '../l10n/app_text.dart';

import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: Text(tr(context, 'My Profile')),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 500),
          child: ListView(
            padding: const EdgeInsets.all(22),
            children: [
              const CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xFFE4F3E8),
                child: Icon(Icons.person, size: 52, color: Color(0xFF167447)),
              ),
              const SizedBox(height: 15),
              Text(
                tr(context, 'Demo Farmer'),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Color(0xFF173D2A),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                tr(context, 'Manage your FERTISIM account'),
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 25),
              ProfileField(
                icon: Icons.person_outline,
                title: tr(context, 'Full Name'),
                value: tr(context, 'Demo Farmer'),
              ),
              ProfileField(
                icon: Icons.phone_outlined,
                title: tr(context, 'Mobile Number'),
                value: '+91 98765 43210',
              ),
              ProfileField(
                icon: Icons.email_outlined,
                title: tr(context, 'Email Address'),
                value: 'farmer@example.com',
              ),
              ProfileField(
                icon: Icons.translate,
                title: tr(context, 'Preferred Language'),
                value: {
                  'en': 'English',
                  'ta': 'தமிழ்',
                  'hi': 'हिन्दी',
                  'te': 'తెలుగు',
                  'ml': 'മലയാളം',
                  'kn': 'ಕನ್ನಡ',
                }[Localizations.localeOf(context).languageCode]!,
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 54,
                child: FilledButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          tr(
                            context,
                            'Profile editing will connect with Firebase',
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit_outlined),
                  label: Text(tr(context, 'Edit Profile')),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF167447),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const ProfileField({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(17),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(17),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFF167447)),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
                const SizedBox(height: 3),
                Text(
                  value,
                  style: const TextStyle(
                    color: Color(0xFF173D2A),
                    fontWeight: FontWeight.bold,
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

class SavedReportsScreen extends StatelessWidget {
  const SavedReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: Text(tr(context, 'Saved Reports')),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 550),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              ReportHistoryCard(
                crop: 'Rice',
                date: '27-08-2026',
                reduction: tr(context, 'Urea reduced by 10%'),
                savings: tr(context, '₹1,700 savings'),
              ),
              ReportHistoryCard(
                crop: 'Maize',
                date: '20-08-2026',
                reduction: tr(context, 'DAP reduced by 15%'),
                savings: tr(context, '₹2,150 savings'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportHistoryCard extends StatelessWidget {
  final String crop;
  final String date;
  final String reduction;
  final String savings;

  const ReportHistoryCard({
    super.key,
    required this.crop,
    required this.date,
    required this.reduction,
    required this.savings,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(19),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 9,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: Color(0xFFE4F3E8),
            child: Icon(Icons.description_outlined, color: Color(0xFF167447)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tr(context, '$crop Analysis'),
                  style: const TextStyle(
                    color: Color(0xFF173D2A),
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(date, style: const TextStyle(color: Colors.grey)),
                const SizedBox(height: 5),
                Text(reduction),
                Text(
                  savings,
                  style: const TextStyle(
                    color: Color(0xFF167447),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.chevron_right),
        ],
      ),
    );
  }
}
