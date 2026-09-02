import 'package:flutter/material.dart';
import 'report_screen.dart';
class FarmAnalysisScreen extends StatefulWidget {
  const FarmAnalysisScreen({super.key});

  @override
  State<FarmAnalysisScreen> createState() => _FarmAnalysisScreenState();
}

class _FarmAnalysisScreenState extends State<FarmAnalysisScreen> {
  String crop = 'Rice';
  String season = 'Kharif';
  String irrigation = 'Rainfed';
  String fertilizer = 'Urea';
  String landUnit = 'Acres';
  double reduction = 10;

  InputDecoration inputStyle(String label, {String? suffix}) {
    return InputDecoration(
      labelText: label,
      suffixText: suffix,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(14),
        borderSide: BorderSide.none,
      ),
    );
  }

  Widget numberField(String label, {String? suffix}) {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: inputStyle(label, suffix: suffix),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: const Text('Farm Analysis'),
      ),
      body: SafeArea(
        child: Center(
          child: Container(
            constraints: const BoxConstraints(maxWidth: 600),
            child: ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const Text(
                  'Farm Information',
                  style: TextStyle(
                    color: Color(0xFF173D2A),
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 7),
                const Text(
                  'Enter the values required for fertilizer simulation.',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 24),

                const SectionTitle(
                  icon: Icons.science_outlined,
                  title: 'Soil Information',
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: numberField('Nitrogen', suffix: 'kg/ha')),
                    const SizedBox(width: 12),
                    Expanded(
                      child: numberField('Phosphorus', suffix: 'kg/ha'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(child: numberField('Potassium', suffix: 'kg/ha')),
                    const SizedBox(width: 12),
                    Expanded(child: numberField('Soil pH')),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: numberField('Organic Carbon', suffix: '%'),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: numberField('EC (optional)', suffix: 'dS/m'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                numberField('Moisture (optional)', suffix: '%'),

                const SizedBox(height: 28),
                const SectionTitle(
                  icon: Icons.grass_rounded,
                  title: 'Crop Information',
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  initialValue: crop,
                  decoration: inputStyle('Crop'),
                  items: ['Rice', 'Wheat', 'Maize', 'Groundnut', 'Soybean']
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      crop = value!;
                    });
                  },
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: season,
                  decoration: inputStyle('Season'),
                  items: ['Kharif', 'Rabi', 'Summer']
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      season = value!;
                    });
                  },
                ),

                const SizedBox(height: 28),
                const SectionTitle(
                  icon: Icons.landscape_outlined,
                  title: 'Land and Irrigation',
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    Expanded(child: numberField('Land size')),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        initialValue: landUnit,
                        decoration: inputStyle('Unit'),
                        items: ['Acres', 'Hectares']
                            .map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(item),
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            landUnit = value!;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                DropdownButtonFormField<String>(
                  initialValue: irrigation,
                  decoration: inputStyle('Irrigation type'),
                  items: ['Drip', 'Sprinkler', 'Flood', 'Rainfed']
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      irrigation = value!;
                    });
                  },
                ),

                const SizedBox(height: 28),
                const SectionTitle(
                  icon: Icons.eco_outlined,
                  title: 'Fertilizer Reduction',
                ),
                const SizedBox(height: 14),
                DropdownButtonFormField<String>(
                  initialValue: fertilizer,
                  decoration: inputStyle('Fertilizer to reduce'),
                  items: ['Urea', 'DAP', 'MOP', 'NPK']
                      .map(
                        (item) => DropdownMenuItem(
                          value: item,
                          child: Text(item),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      fertilizer = value!;
                    });
                  },
                ),
                const SizedBox(height: 18),
                Text(
                  'Reduction: ${reduction.toInt()}%',
                  style: const TextStyle(
                    color: Color(0xFF173D2A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Slider(
                  value: reduction,
                  min: 5,
                  max: 50,
                  divisions: 9,
                  label: '${reduction.toInt()}%',
                  activeColor: const Color(0xFF167447),
                  onChanged: (value) {
                    setState(() {
                      reduction = value;
                    });
                  },
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 56,
                  child: FilledButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SimulationResultScreen(
                            crop: crop,
                            fertilizer: fertilizer,
                            reduction: reduction.toInt(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.auto_graph_rounded),
                    label: const Text(
                      'Run AI Simulation',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFF167447),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
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

class SectionTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const SectionTitle({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: const Color(0xFFE4F3E8),
          child: Icon(icon, color: const Color(0xFF167447)),
        ),
        const SizedBox(width: 10),
        Text(
          title,
          style: const TextStyle(
            color: Color(0xFF173D2A),
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SimulationResultScreen extends StatelessWidget {
  final String crop;
  final String fertilizer;
  final int reduction;

  const SimulationResultScreen({
    super.key,
    required this.crop,
    required this.fertilizer,
    required this.reduction,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: const Text('AI Simulation Results'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 600),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFF0B5D32),
                      Color(0xFF3A9D5D),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(22),
                ),
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.white,
                      size: 48,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Simulation Completed',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '$crop • $fertilizer reduced by $reduction%',
                      style: const TextStyle(color: Colors.white70),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const ResultCard(
                icon: Icons.agriculture,
                title: 'Yield Prediction',
                before: '48.5 q/ha',
                after: '47.2 q/ha',
                status: 'Only 2.7% change',
                color: Color(0xFF2E7D32),
              ),
              const ResultCard(
                icon: Icons.trending_up,
                title: 'Crop Success Probability',
                before: '89%',
                after: '86%',
                status: 'High success',
                color: Color(0xFF1976D2),
              ),
              const ResultCard(
                icon: Icons.eco,
                title: 'Soil Health',
                before: '72%',
                after: '80%',
                status: 'Improved by 8%',
                color: Color(0xFFE08A00),
              ),
              const ResultCard(
                icon: Icons.currency_rupee,
                title: 'Fertilizer Cost',
                before: '₹12,500',
                after: '₹10,800',
                status: 'You save ₹1,700',
                color: Color(0xFF7B4BB7),
              ),
              const SizedBox(height: 18),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFF4D6),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommended Organic Alternative',
                      style: TextStyle(
                        color: Color(0xFF6C5100),
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Farmyard Manure: 5 t/ha\nNeem Cake: 200 kg/ha',
                      style: TextStyle(
                        color: Color(0xFF6C5100),
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Helps maintain soil organic carbon and compensates for reduced chemical fertilizer.',
                      style: TextStyle(
                        color: Color(0xFF6C5100),
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              SizedBox(
                height: 55,
                child: FilledButton.icon(
                  onPressed: () {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => const ReportScreen(),
    ),
  );
},
                  icon: const Icon(Icons.picture_as_pdf_outlined),
                  label: const Text(
                    'View Recommendation Report',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: FilledButton.styleFrom(
                    backgroundColor: const Color(0xFF167447),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
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

class ResultCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String before;
  final String after;
  final String status;
  final Color color;

  const ResultCard({
    super.key,
    required this.icon,
    required this.title,
    required this.before,
    required this.after,
    required this.status,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Color(0x12000000),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color.withValues(alpha: 0.12),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Color(0xFF173D2A),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text('Before: $before'),
                Text('After reduction: $after'),
                const SizedBox(height: 5),
                Text(
                  status,
                  style: TextStyle(
                    color: color,
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