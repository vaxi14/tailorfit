import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class JobDescriptionScreen extends StatefulWidget {
  const JobDescriptionScreen({super.key});

  @override
  State<JobDescriptionScreen> createState() => _JobDescriptionScreenState();
}

class _JobDescriptionScreenState extends State<JobDescriptionScreen> {
  final companyController = TextEditingController();
  final titleController = TextEditingController();
  final jdController = TextEditingController();

  @override
  void dispose() {
    companyController.dispose();
    titleController.dispose();
    jdController.dispose();
    super.dispose();
  }

  String createSlug(String text) {
    return text.trim().toLowerCase().replaceAll(' ', '-');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Paste Job Description'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              children: [
                TextField(
                  controller: companyController,
                  decoration: const InputDecoration(
                    labelText: 'Company Name',
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    labelText: 'Job Title',
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: TextField(
                    controller: jdController,
                    maxLines: null,
                    expands: true,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: const InputDecoration(
                      labelText: 'Paste Job Description',
                      alignLabelWithHint: true,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      final company = companyController.text.trim();

                      if (company.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Please enter company name'),
                          ),
                        );
                        return;
                      }

                      final slug = createSlug(company);
                      context.go('/p/$slug');
                    },
                    child: const Text('Generate Portfolio Preview'),
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