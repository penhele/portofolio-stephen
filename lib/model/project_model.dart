class ProjectModel {
  final String title;
  final String description;
  final String githubUrl;
  final String thumbnail;
  final String? youtubeUrl;
  final String? documentUrl;

  ProjectModel({
    required this.title,
    required this.description,
    required this.githubUrl,
    required this.thumbnail,
    this.youtubeUrl,
    this.documentUrl,
  });
}
