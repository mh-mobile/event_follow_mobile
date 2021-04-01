class SessionsApiResponse {
  final String status;
  final String? message;

  SessionsApiResponse({
    required this.status,
    this.message,
  });

  factory SessionsApiResponse.fromJson(Map<String, dynamic> json) {
    return SessionsApiResponse(status: json["status"], message: json["message"]);
  }
}
