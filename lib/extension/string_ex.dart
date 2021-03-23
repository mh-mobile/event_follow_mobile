
extension StringExtension on String {
  String removeAllHtmlTags() {
    final exp = RegExp(
      r"<[^>]*>",
      multiLine: true,
      caseSensitive: true
    );

    return this.replaceAll(exp, "");
  }
}
