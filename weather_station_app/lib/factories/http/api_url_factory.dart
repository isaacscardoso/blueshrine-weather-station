String makeApiUrl({
  required String scheme,
  required String subdomain,
  String? path,
}) {
  return '$scheme://$subdomain.openweathermap.org/$path';
}
