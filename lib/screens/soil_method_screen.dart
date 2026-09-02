import 'package:flutter/material.dart';
import 'farm_analysis_screen.dart';
import 'soil_upload_screen.dart';
class SoilMethodScreen extends StatefulWidget {
  const SoilMethodScreen({super.key});

  @override
  State<SoilMethodScreen> createState() => _SoilMethodScreenState();
}

class _SoilMethodScreenState extends State<SoilMethodScreen> {
  String selectedMethod = 'upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: const Text('Farm Information'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 520),
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Step 1 of 4',
                  style: TextStyle(
                    color: Color(0xFF167447),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const LinearProgressIndicator(
                  value: 0.25,
                  minHeight: 8,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  backgroundColor: Color(0xFFDDE8DF),
                  color: Color(0xFF167447),
                ),
                const SizedBox(height: 30),
                const Text(
                  'Add Soil Information',
                  style: TextStyle(
                    color: Color(0xFF173D2A),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose how you want to provide your soil-test values.',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 28),
                MethodCard(
                  title: 'Upload Soil Health Card',
                  subtitle: 'Upload a PDF or image of your soil report',
                  icon: Icons.upload_file_rounded,
                  badge: 'Recommended',
                  selected: selectedMethod == 'upload',
                  onTap: () {
                    setState(() {
                      selectedMethod = 'upload';
                    });
                  },
                ),
                const SizedBox(height: 16),
                MethodCard(
                  title: 'Enter Values Manually',
                  subtitle: 'Enter N, P, K, pH and organic carbon',
                  icon: Icons.edit_note_rounded,
                  selected: selectedMethod == 'manual',
                  onTap: () {
                    setState(() {
                      selectedMethod = 'manual';
                    });
                  },
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                   onPressed: () {
  if (selectedMethod == 'upload') {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SoilUploadScreen(),
      ),
    );
  } else {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const FarmAnalysisScreen(),
      ),
    );
  }
},
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF167447),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Continue',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MethodCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String? badge;
  final bool selected;
  final VoidCallback onTap;

  const MethodCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.badge,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFE4F3E8) : Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: selected
                ? const Color(0xFF167447)
                : const Color(0xFFE0E0E0),
            width: selected ? 2 : 1,
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x10000000),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              radius: 27,
              backgroundColor: selected
                  ? const Color(0xFF167447)
                  : const Color(0xFFE9EFEA),
              child: Icon(
                icon,
                color: selected ? Colors.white : const Color(0xFF167447),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (badge != null)
                    Container(
                      margin: const EdgeInsets.only(bottom: 7),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFFE8A3),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        badge!,
                        style: const TextStyle(
                          color: Color(0xFF755500),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Color(0xFF173D2A),
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: const Color(0xFF167447),
            ),
          ],
        ),
      ),
    );
  }
}
