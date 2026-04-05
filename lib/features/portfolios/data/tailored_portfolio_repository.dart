import '../domain/tailored_portfolio.dart';

abstract class TailoredPortfolioRepository {
  Future<TailoredPortfolio?> getPortfolioBySlug(String slug);
}