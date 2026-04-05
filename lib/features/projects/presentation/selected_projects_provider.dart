import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/project_repository_provider.dart';
import '../domain/project.dart';

final selectedProjectsProvider =
    FutureProvider.family<List<Project>, List<String>>((ref, ids) async {
  final repository = ref.watch(projectRepositoryProvider);
  return repository.getProjectsByIds(ids);
});