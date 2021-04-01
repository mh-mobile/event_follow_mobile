class SessionsApiRequest {
  final String token;
  final String accessToken;
  final String accessTokenSecret;

  SessionsApiRequest({
    required this.token,
    required this.accessToken,
    required this.accessTokenSecret,
  });

  Map<String, dynamic> toJson() => {
    "token": this.token,
    "access_token": this.accessToken,
    "access_token_secret": this.accessTokenSecret,
  };
}
