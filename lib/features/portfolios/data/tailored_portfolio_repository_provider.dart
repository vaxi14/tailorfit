import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'mock_tailored_portfolio_repository.dart';
import 'tailored_portfolio_repository.dart';

final tailoredPortfolioRepositoryProvider =
    Provider<TailoredPortfolioRepository>((ref) {
  return MockTailoredPortfolioRepository();
});