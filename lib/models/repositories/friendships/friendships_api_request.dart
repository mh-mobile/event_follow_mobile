class FriendshipsApiRequest {
  final String userIds;

  FriendshipsApiRequest({
    required this.userIds,
  });

  Map<String, String> toParams() => {
        "user_ids": this.userIds,
      };
}
