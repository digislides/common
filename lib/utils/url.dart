bool isMediaUrl(String url) {
  if (url == null || url.isEmpty || url == 'none') return false;

  try {
    final uri = Uri.parse(url);
    if (uri.scheme != 'http' && uri.scheme != 'https') return false;

    return true;
  } catch (e) {
    return false;
  }
}
