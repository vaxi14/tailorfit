class TailoredPortfolio {
  final String id;
  final String slug;
  final String company;
  final String jobTitle;
  final List<String> selectedProjectIds;
  final String summary;

  const TailoredPortfolio({
    required this.id,
    required this.slug,
    required this.company,
    required this.jobTitle,
    required this.selectedProjectIds,
    required this.summary,
  });
}