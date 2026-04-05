import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../projects/presentation/selected_projects_provider.dart';
import 'public_portfolio_provider.dart';

class PublicPortfolioScreen extends ConsumerWidget {
  final String slug;

  const PublicPortfolioScreen({
    super.key,
    required this.slug,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final portfolioAsync = ref.watch(publicPortfolioProvider(slug));

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text('Tailored Portfolio'),
        centerTitle: true,
      ),
      body: portfolioAsync.when(
        data: (portfolio) {
          if (portfolio == null) {
            return const Center(
              child: Text('Portfolio not found'),
            );
          }

          final selectedProjectsAsync = ref.watch(
            selectedProjectsProvider(portfolio.selectedProjectIds),
          );

          return selectedProjectsAsync.when(
            data: (projects) {
              final allSkills = projects
                  .expand((project) => project.skills)
                  .toSet()
                  .toList();

              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 900),
                  child: ListView(
                    padding: const EdgeInsets.all(24),
                    children: [
                      Container(
                        padding: const EdgeInsets.all(24),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 20,
                              offset: const Offset(0, 8),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Tailored for ${portfolio.company}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              portfolio.jobTitle,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    color: Colors.indigo,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              portfolio.summary,
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            const SizedBox(height: 24),
                            Wrap(
                              spacing: 10,
                              runSpacing: 10,
                              children: allSkills
                                  .map(
                                    (skill) => Chip(
                                      label: Text(skill),
                                      backgroundColor:
                                          Colors.indigo.withOpacity(0.08),
                                      side: BorderSide.none,
                                    ),
                                  )
                                  .toList(),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Text(
                        'Relevant Projects',
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                      const SizedBox(height: 16),
                      if (projects.isEmpty)
                        const Text('No relevant projects found')
                      else
                        ...projects.map(
                          (project) => Container(
                            margin: const EdgeInsets.only(bottom: 16),
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(18),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.04),
                                  blurRadius: 16,
                                  offset: const Offset(0, 6),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  project.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  project.description,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                                const SizedBox(height: 14),
                                Text(
                                  'Role',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(project.role),
                                const SizedBox(height: 14),
                                Text(
                                  'Impact',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge
                                      ?.copyWith(
                                        color: Colors.grey[700],
                                        fontWeight: FontWeight.bold,
                                      ),
                                ),
                                const SizedBox(height: 4),
                                Text(project.impact),
                                const SizedBox(height: 14),
                                Wrap(
                                  spacing: 8,
                                  runSpacing: 8,
                                  children: project.skills
                                      .map(
                                        (skill) => Chip(
                                          label: Text(skill),
                                          backgroundColor:
                                              Colors.grey.shade100,
                                          side: BorderSide.none,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (error, stackTrace) => Center(
              child: Text('Error loading projects: $error'),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}