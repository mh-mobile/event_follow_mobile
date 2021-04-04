extension StringExtension on String {
  String removeAllHtmlTags() {
    final exp = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);

    return this.replaceAll(exp, "");
  }

  String stripEventDescription({maxLength: 200}) {
    if (this.length > maxLength) {
      return this.substring(0, maxLength) + "...";
    }

    return this;
  }
}
