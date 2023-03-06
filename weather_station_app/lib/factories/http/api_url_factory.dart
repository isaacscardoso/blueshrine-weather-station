String makeApiUrl(String scheme, String subdomain, String path) {
  return '$scheme://$subdomain.openweathermap.org/$path';
}
