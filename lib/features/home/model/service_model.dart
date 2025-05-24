class ServiceModel {
  final String title;
  final String subtitle;
  final String iconPath;
  final String backgroundImage;

  ServiceModel({
    required this.title,
    required this.subtitle,
    required this.iconPath,
    required this.backgroundImage,
  });

  factory ServiceModel.fromMap(Map<String, dynamic> map) {
    return ServiceModel(
      title: map['title'] ?? '',
      subtitle: map['subtitle'] ?? '',
      iconPath: map['icon'] ?? '',
      backgroundImage: map['background'] ?? '',
    );
  }

  factory ServiceModel.fromDoc(dynamic doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ServiceModel.fromMap(data);
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
      'icon': iconPath,
      'background': backgroundImage,
    };
  }
}
