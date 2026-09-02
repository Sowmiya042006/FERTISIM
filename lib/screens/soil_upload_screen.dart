import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'farm_analysis_screen.dart';

class SoilUploadScreen extends StatefulWidget {
  const SoilUploadScreen({super.key});

  @override
  State<SoilUploadScreen> createState() => _SoilUploadScreenState();
}

class _SoilUploadScreenState extends State<SoilUploadScreen> {
  PlatformFile? selectedFile;

 Future<void> pickSoilCard() async {
  final file = await FilePicker.pickFile(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
  );

  if (file != null) {
    setState(() {
      selectedFile = file;
    });
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: const Text('Upload Soil Health Card'),
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
                const SizedBox(height: 28),
                const Text(
                  'Upload your soil report',
                  style: TextStyle(
                    color: Color(0xFF173D2A),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Choose a clear PDF or image of your Soil Health Card.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 25),
                InkWell(
                  onTap: pickSoilCard,
                  borderRadius: BorderRadius.circular(22),
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 42,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      border: Border.all(
                        color: selectedFile == null
                            ? const Color(0xFF9DB8A5)
                            : const Color(0xFF167447),
                        width: 2,
                      ),
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundColor: const Color(0xFFE4F3E8),
                          child: Icon(
                            selectedFile == null
                                ? Icons.cloud_upload_outlined
                                : Icons.check_circle_outline,
                            size: 38,
                            color: const Color(0xFF167447),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          selectedFile == null
                              ? 'Tap to choose a file'
                              : 'Soil report selected',
                          style: const TextStyle(
                            color: Color(0xFF173D2A),
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 7),
                        Text(
                          selectedFile?.name ??
                              'Supported formats: PDF, JPG and PNG',
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ),
                if (selectedFile != null)
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton.icon(
                      onPressed: pickSoilCard,
                      icon: const Icon(Icons.refresh),
                      label: const Text('Replace file'),
                    ),
                  ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFF4D6),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        color: Color(0xFF936B00),
                      ),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'The app will extract N, P, K, pH and organic carbon values from your report.',
                          style: TextStyle(
                            color: Color(0xFF6C5100),
                            height: 1.4,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: FilledButton(
                    onPressed: selectedFile == null
    ? null
    : () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const FarmAnalysisScreen(),
          ),
        );
      },
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF167447),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: const Text(
                      'Extract Soil Values',
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