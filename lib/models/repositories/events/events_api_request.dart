class EventsApiRequest {
  final String pageId;
  final String? sort;
  final String? time;
  final String? friends;

  EventsApiRequest({
    required this.pageId,
    this.sort,
    this.time,
    this.friends,
  });

  Map<String, String> toParams() => {
    "page": this.pageId,
    if (this.sort != null) "sort": this.sort!,
    if (this.time != null) "time": this.time!,
    if (this.friends != null) "friends": this.friends!,
  };
}