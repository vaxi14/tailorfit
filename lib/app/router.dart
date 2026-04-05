import 'package:go_router/go_router.dart';
import '../features/admin/presentation/admin_screen.dart';
import '../features/home/presentation/home_screen.dart';
import '../features/job_descriptions/presentation/job_description_screen.dart';
import '../features/projects/presentation/projects_screen.dart';
import '../features/public_portfolio/presentation/public_portfolio_screen.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/admin',
      builder: (context, state) => const AdminScreen(),
    ),
    GoRoute(
      path: '/admin/projects',
      builder: (context, state) => const ProjectsScreen(),
    ),
    GoRoute(
      path: '/admin/job-description',
      builder: (context, state) => const JobDescriptionScreen(),
    ),
    GoRoute(
      path: '/p/:slug',
      builder: (context, state) {
        final slug = state.pathParameters['slug']!;
        return PublicPortfolioScreen(slug: slug);
      },
    ),
  ],
);