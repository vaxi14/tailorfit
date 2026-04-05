import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'projects_provider.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final projectsAsync = ref.watch(projectsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Projects'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 900),
          child: projectsAsync.when(
            data: (projects) {
              return ListView.builder(
                padding: const EdgeInsets.all(24),
                itemCount: projects.length,
                itemBuilder: (context, index) {
                  final project = projects[index];

                  return Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            project.title,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8),
                          Text(project.description),
                          const SizedBox(height: 12),
                          Text('Role: ${project.role}'),
                          const SizedBox(height: 8),
                          Text('Impact: ${project.impact}'),
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: project.skills
                                .map(
                                  (skill) => Chip(
                                    label: Text(skill),
                                    side: BorderSide.none,
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error: $error'),
            ),
          ),
        ),
      ),
    );
  }
}