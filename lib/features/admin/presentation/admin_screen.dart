import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Admin Dashboard'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: ListView(
            padding: const EdgeInsets.all(24),
            children: [
              Text(
                'Manage TailorFit',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 8),
              Text(
                'Add projects, paste job descriptions, and generate tailored portfolio links.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 24),
              _AdminActionCard(
                title: 'Manage Projects',
                subtitle: 'Create and maintain your master project list.',
                buttonText: 'Open Projects',
                onTap: () => context.go('/admin/projects'),
              ),
              const SizedBox(height: 16),
              _AdminActionCard(
                title: 'Paste Job Description',
                subtitle: 'Input a job posting and generate a tailored portfolio preview.',
                buttonText: 'Open JD Input',
                onTap: () => context.go('/admin/job-description'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AdminActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String buttonText;
  final VoidCallback onTap;

  const _AdminActionCard({
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: 8),
            Text(subtitle),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTap,
              child: Text(buttonText),
            ),
          ],
        ),
      ),
    );
  }
}