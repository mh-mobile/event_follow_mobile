class FollowingTweetsApiRequest {
  final String eventId;

  FollowingTweetsApiRequest({
    required this.eventId,
  });

  Map<String, String> toParams() => {
    "event_id": this.eventId,
  };
}
