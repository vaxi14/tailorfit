import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/project_repository_provider.dart';
import '../domain/project.dart';

final projectsProvider = FutureProvider<List<Project>>((ref) async {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getProjects();
});