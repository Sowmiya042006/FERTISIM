import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class ReportScreen extends StatelessWidget {
  const ReportScreen({super.key});

  Future<Uint8List> generatePdf() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(35),
        header: (context) {
          return pw.Container(
            padding: const pw.EdgeInsets.only(bottom: 12),
            decoration: const pw.BoxDecoration(
              border: pw.Border(
                bottom: pw.BorderSide(
                  color: PdfColors.green700,
                  width: 2,
                ),
              ),
            ),
            child: pw.Row(
              mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
              children: [
                pw.Text(
                  'FERTISIM',
                  style: pw.TextStyle(
                    color: PdfColors.green800,
                    fontSize: 22,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.Text(
                  'Recommendation Report',
                  style: const pw.TextStyle(
                    color: PdfColors.grey700,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          );
        },
        footer: (context) {
          return pw.Container(
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 12),
            child: pw.Text(
              'Page ${context.pageNumber} of ${context.pagesCount}',
              style: const pw.TextStyle(
                color: PdfColors.grey600,
                fontSize: 10,
              ),
            ),
          );
        },
        build: (context) {
          return [
            pw.SizedBox(height: 20),
            pw.Text(
              'Fertilizer Reduction and Crop Performance Assessment',
              textAlign: pw.TextAlign.center,
              style: pw.TextStyle(
                fontSize: 18,
                fontWeight: pw.FontWeight.bold,
                color: PdfColors.green800,
              ),
            ),
            pw.SizedBox(height: 8),
            pw.Text(
              'AI-based decision-support report for sustainable fertilizer management',
              textAlign: pw.TextAlign.center,
              style: const pw.TextStyle(
                fontSize: 11,
                color: PdfColors.grey700,
              ),
            ),
            pw.SizedBox(height: 24),
            buildPdfSection(
              'Farmer and Farm Details',
              [
                'Farmer: Demo Farmer',
                'Crop: Rice',
                'Season: Kharif',
                'Land size: 2 Acres',
                'Irrigation: Rainfed',
              ],
            ),
            buildPdfSection(
              'Soil Summary',
              [
                'Nitrogen: 245 kg/ha',
                'Phosphorus: 22 kg/ha',
                'Potassium: 280 kg/ha',
                'Soil pH: 6.8',
                'Organic Carbon: 0.62%',
              ],
            ),
            buildPdfSection(
              'Fertilizer Reduction Plan',
              [
                'Selected fertilizer: Urea',
                'Reduction percentage: 10%',
                'Original dose: 100 kg/ha',
                'Reduced dose: 90 kg/ha',
              ],
            ),
            buildPdfSection(
              'Organic Fertilizer Recommendation',
              [
                'Farmyard Manure: 5 t/ha',
                'Neem Cake: 200 kg/ha',
                'Purpose: Maintain soil fertility and organic carbon.',
              ],
            ),
            buildPdfSection(
              'AI Prediction Results',
              [
                'Yield before reduction: 48.5 q/ha',
                'Yield after reduction: 47.2 q/ha',
                'Crop success probability: 86%',
                'Soil health score: 80%',
                'Original fertilizer cost: Rs. 12,500',
                'Reduced fertilizer cost: Rs. 10,800',
                'Estimated cost savings: Rs. 1,700',
              ],
            ),
            pw.SizedBox(height: 15),
            pw.Container(
              padding: const pw.EdgeInsets.all(12),
              decoration: pw.BoxDecoration(
                color: PdfColors.amber50,
                
                border: pw.Border.all(
                  color: PdfColors.amber700,
                ),
              ),
              child: pw.Text(
                'Note: FERTISIM is a decision-support system. Farmers should '
                'consult agricultural experts before making major fertilizer changes.',
                style: const pw.TextStyle(
                  fontSize: 10,
                  color: PdfColors.brown800,
                ),
              ),
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }

  pw.Widget buildPdfSection(
    String title,
    List<String> values,
  ) {
    return pw.Container(
      width: double.infinity,
      margin: const pw.EdgeInsets.only(bottom: 14),
      padding: const pw.EdgeInsets.all(14),
      decoration: pw.BoxDecoration(
        color: PdfColors.grey100,
        
        border: const pw.Border(
          left: pw.BorderSide(
            color: PdfColors.green700,
            width: 4,
          ),
        ),
      ),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              color: PdfColors.green800,
              fontSize: 14,
              fontWeight: pw.FontWeight.bold,
            ),
          ),
          pw.SizedBox(height: 8),
          ...values.map(
            (value) => pw.Padding(
              padding: const pw.EdgeInsets.only(bottom: 4),
              child: pw.Text(
                value,
                style: const pw.TextStyle(
                  fontSize: 11,
                  lineSpacing: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F8F2),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0B5D32),
        foregroundColor: Colors.white,
        title: const Text('Recommendation Report'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 650),
          child: ListView(
            padding: const EdgeInsets.all(20),
            children: [
              Container(
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(22),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x15000000),
                      blurRadius: 12,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Column(
                  children: [
                    Icon(
                      Icons.eco,
                      color: Color(0xFF167447),
                      size: 48,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'FERTISIM',
                      style: TextStyle(
                        color: Color(0xFF173D2A),
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Fertilizer Reduction Recommendation Report',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              const ReportSection(
                title: 'Farmer & Farm Details',
                content:
                    'Farmer: Demo Farmer\n'
                    'Crop: Rice\n'
                    'Season: Kharif\n'
                    'Land size: 2 Acres\n'
                    'Irrigation: Rainfed',
              ),
              const ReportSection(
                title: 'Soil Summary',
                content:
                    'Nitrogen: 245 kg/ha\n'
                    'Phosphorus: 22 kg/ha\n'
                    'Potassium: 280 kg/ha\n'
                    'pH: 6.8\n'
                    'Organic Carbon: 0.62%',
              ),
              const ReportSection(
                title: 'Fertilizer Reduction Plan',
                content:
                    'Selected fertilizer: Urea\n'
                    'Reduction percentage: 10%\n'
                    'Original dose: 100 kg/ha\n'
                    'Reduced dose: 90 kg/ha',
              ),
              const ReportSection(
                title: 'Organic Recommendation',
                content:
                    'Farmyard Manure: 5 t/ha\n'
                    'Neem Cake: 200 kg/ha\n'
                    'Purpose: Maintain soil fertility and organic carbon.',
              ),
              const ReportSection(
                title: 'AI Predictions',
                content:
                    'Yield after reduction: 47.2 q/ha\n'
                    'Crop success probability: 86%\n'
                    'Soil health score: 80%\n'
                    'Estimated cost savings: Rs. 1,700',
              ),
              const SizedBox(height: 18),
              SizedBox(
                height: 55,
                child: FilledButton.icon(
                  onPressed: () async {
                    try {
                      final pdfBytes = await generatePdf();

                      await Printing.sharePdf(
                        bytes: pdfBytes,
                        filename: 'FERTISIM_Recommendation_Report.pdf',
                      );
                    } catch (error) {
                      if (!context.mounted) return;

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Unable to generate PDF: $error',
                          ),
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.download_rounded),
                  label: const Text(
                    'Download PDF',
                    style: TextStyle(
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
              const SizedBox(height: 12),
              SizedBox(
                height: 52,
                child: OutlinedButton.icon(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Report saved successfully'),
                      ),
                    );
                  },
                  icon: const Icon(Icons.bookmark_add_outlined),
                  label: const Text('Save Report'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF167447),
                    side: const BorderSide(
                      color: Color(0xFF167447),
                    ),
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

class ReportSection extends StatelessWidget {
  final String title;
  final String content;

  const ReportSection({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: const Border(
          left: BorderSide(
            color: Color(0xFF167447),
            width: 5,
          ),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color(0x10000000),
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF173D2A),
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 9),
          Text(
            content,
            style: const TextStyle(
              color: Color(0xFF4F5F55),
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}