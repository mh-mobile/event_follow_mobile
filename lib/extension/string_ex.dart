extension StringExtension on String {
  String removeAllHtmlTags() {
    final exp = RegExp(r'<[^>]*>', multiLine: true, caseSensitive: true);

    return replaceAll(exp, '');
  }

  String stripEventDescription({int maxLength = 200}) {
    if (length > maxLength) {
      return substring(0, maxLength) + '...';
    }

    return this;
  }
}
