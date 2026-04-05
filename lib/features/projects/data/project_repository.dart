import '../domain/project.dart';

abstract class ProjectRepository {
  Future<List<Project>> getProjects();
  Future<List<Project>> getProjectsByIds(List<String> ids);
}