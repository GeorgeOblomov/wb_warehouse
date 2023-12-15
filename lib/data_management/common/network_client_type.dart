enum NetworkClientType {
  content('https://suppliers-api.wildberries.ru'),
  marketplace('https://suppliers-api.wildberries.ru'),
  statistics('https://statistics-api.wildberries.ru'),
  reviews('https://feedbacks-api.wildberries.ru'),
  prices('https://suppliers-api.wildberries.ru'),
  analytics('https://suppliers-api.wildberries.ru'),
  gpt('test');

  final String baseUrl;

  const NetworkClientType(this.baseUrl);
}
