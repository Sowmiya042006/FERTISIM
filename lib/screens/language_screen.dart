import '../l10n/app_text.dart';

import 'package:flutter/material.dart';

import 'login_screen.dart';
import '../locale_controller.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';

  final List<Map<String, String>> languages = [
    {'name': 'English', 'native': 'English'},
    {'name': 'Tamil', 'native': 'தமிழ்'},
    {'name': 'Hindi', 'native': 'हिन्दी'},
    {'name': 'Telugu', 'native': 'తెలుగు'},
    {'name': 'Malayalam', 'native': 'മലയാളം'},
    {'name': 'Kannada', 'native': 'ಕನ್ನಡ'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: Text(tr(context, 'Select Language')),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 500),
            padding: const EdgeInsets.all(22),
            child: Column(
              children: [
                const SizedBox(height: 15),
                const CircleAvatar(
                  radius: 38,
                  backgroundColor: Color(0xFFE1F2E6),
                  child: Icon(
                    Icons.translate_rounded,
                    size: 40,
                    color: Color(0xFF167447),
                  ),
                ),
                const SizedBox(height: 18),
                Text(
                  tr(context, 'Choose your preferred language'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF173D2A),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  tr(context, 'You can change this later from settings'),
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 28),
                Expanded(
                  child: GridView.builder(
                    itemCount: languages.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 14,
                          mainAxisSpacing: 14,
                          childAspectRatio: 1.55,
                        ),
                    itemBuilder: (context, index) {
                      final language = languages[index];
                      final isSelected = selectedLanguage == language['name'];

                      return InkWell(
                        borderRadius: BorderRadius.circular(18),
                        onTap: () {
                          setState(() {
                            selectedLanguage = language['name']!;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? const Color(0xFFE1F2E6)
                                : Colors.white,
                            borderRadius: BorderRadius.circular(18),
                            border: Border.all(
                              color: isSelected
                                  ? const Color(0xFF167447)
                                  : const Color(0xFFE0E0E0),
                              width: isSelected ? 2 : 1,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                color: Color(0x11000000),
                                blurRadius: 8,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Stack(
                            children: [
                              Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      language['native']!,
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xFF173D2A),
                                      ),
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      language['name']!,
                                      style: const TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              if (isSelected)
                                const Positioned(
                                  right: 10,
                                  top: 10,
                                  child: Icon(
                                    Icons.check_circle,
                                    color: Color(0xFF167447),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  height: 54,
                  child: FilledButton(
                    onPressed: () {
                      final languageCodes = {
                        'English': 'en',
                        'Tamil': 'ta',
                        'Hindi': 'hi',
                        'Telugu': 'te',
                        'Malayalam': 'ml',
                        'Kannada': 'kn',
                      };

                      appLocale.value = Locale(
                        languageCodes[selectedLanguage] ?? 'en',
                      );

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF167447),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      "${tr(context, 'Continue')} • $selectedLanguage",
                      style: const TextStyle(
                        fontSize: 16,
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
