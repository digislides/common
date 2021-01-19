bool isDownloadableMediaUrl(String url) {
  if (url == null || url.trim().isEmpty || url == 'none') return false;

  try {
    final uri = Uri.parse(url);
    if (uri.scheme != 'http' && uri.scheme != 'https') return false;

    return true;
  } catch (e) {
    return false;
  }
}

bool isValidMediaUrl(String url) {
  if (url == null || url.trim().isEmpty || url == 'none') return false;

  try {
    final uri = Uri.parse(url);
    return true;
  } catch (e) {
    return false;
  }
}

String transformForeignUrl(String url, String newScheme, String newHost, int newPort) {
  final newUri = Uri(
      scheme: newScheme,
      host: newHost,
      port: newPort,
      path: '/external/media',
      queryParameters: {
        'url': url,
      });
  final newUrl = newUri.toString();
  return newUrl;
}