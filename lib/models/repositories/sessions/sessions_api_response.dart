class SessionsApiResponse {
  SessionsApiResponse({
    required this.status,
    this.message,
  });

  factory SessionsApiResponse.fromJson(Map<String, dynamic> json) {
    return SessionsApiResponse(
        status: json['status'], message: json['message']);
  }

  final String status;
  final String? message;
}
