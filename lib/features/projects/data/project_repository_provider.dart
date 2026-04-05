import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mock_project_repository.dart';
import 'project_repository.dart';

final projectRepositoryProvider = Provider<ProjectRepository>((ref) {
  return MockProjectRepository();
});