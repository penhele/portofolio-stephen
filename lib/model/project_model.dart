class ProjectModel {
  final String title;
  final String description;
  final String? githubUrl;
  final String thumbnail;
  final String? youtubeUrl;
  final String? documentUrl;
  final String duration;

  ProjectModel({
    required this.title,
    required this.description,
    this.githubUrl,
    required this.thumbnail,
    this.youtubeUrl,
    this.documentUrl,
    required this.duration,
  });
}
