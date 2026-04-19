class UploadResponse {
  final String key;
  final String bucket;
  final String publicUrl;

  UploadResponse({
    required this.key,
    required this.bucket,
    required this.publicUrl,
  });

  factory UploadResponse.fromJson(Map<String, dynamic> json) => UploadResponse(
        key: json['key'] as String,
        bucket: json['bucket'] as String,
        publicUrl: json['publicUrl'] as String,
      );
}
