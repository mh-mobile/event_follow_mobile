class SessionsApiResponse {
  SessionsApiResponse({
    required this.status,
    this.message,
  });

  factory SessionsApiResponse.fromJson(Map<String, dynamic> json) {
    return SessionsApiResponse(
        status: json['status'] as String, message: json['message'] as String?);
  }

  final String status;
  final String? message;
}
