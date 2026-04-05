import '../domain/project.dart';
import 'project_repository.dart';

class MockProjectRepository implements ProjectRepository {
  static const List<Project> _projects = [
    Project(
      id: '1',
      title: 'Food Delivery App',
      description: 'A Flutter-based delivery tracking app',
      skills: ['Flutter', 'Firebase', 'Google Maps'],
      role: 'Flutter Developer',
      impact: 'Improved delivery visibility by 30%',
    ),
    Project(
      id: '2',
      title: 'E-commerce Admin Panel',
      description: 'Dashboard for product and order management',
      skills: ['Flutter', 'REST API', 'State Management'],
      role: 'Frontend Developer',
      impact: 'Reduced admin effort by 40%',
    ),
  ];

  @override
  Future<List<Project>> getProjects() async {
    return _projects;
  }

  @override
  Future<List<Project>> getProjectsByIds(List<String> ids) async {
    return _projects.where((project) => ids.contains(project.id)).toList();
  }
}