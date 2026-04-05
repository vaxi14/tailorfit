import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../portfolios/data/tailored_portfolio_repository_provider.dart';
import '../../portfolios/domain/tailored_portfolio.dart';

final publicPortfolioProvider =
    FutureProvider.family<TailoredPortfolio?, String>((ref, slug) async {
  final repository = ref.watch(tailoredPortfolioRepositoryProvider);
  return repository.getPortfolioBySlug(slug);
});