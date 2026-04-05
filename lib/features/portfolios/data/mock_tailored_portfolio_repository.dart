import '../domain/tailored_portfolio.dart';
import 'tailored_portfolio_repository.dart';

class MockTailoredPortfolioRepository implements TailoredPortfolioRepository {
  @override
  Future<TailoredPortfolio?> getPortfolioBySlug(String slug) async {
    const portfolios = [
      TailoredPortfolio(
        id: '1',
        slug: 'zomato',
        company: 'Zomato',
        jobTitle: 'Flutter Developer',
        selectedProjectIds: ['1', '2'],
        summary:
            'Flutter developer with experience in scalable mobile apps, Firebase integration, and real-time features.',
      ),
    ];

    try {
      return portfolios.firstWhere((portfolio) => portfolio.slug == slug);
    } catch (_) {
      return null;
    }
  }
}