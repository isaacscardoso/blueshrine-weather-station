enum HttpError {
  badRequest('400 - Bad Request'),
  notFound('404 - Not Found'),
  internalServerError('500 - Internal Server Error');

  final String description;

  const HttpError(this.description);

  get statusCode {
    const codes = {
      HttpError.badRequest: 400,
      HttpError.notFound: 404,
      HttpError.internalServerError: 500,
    };
    return codes[this];
  }
}
