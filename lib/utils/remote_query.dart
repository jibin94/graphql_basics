class RemoteQuery {
  static const String getCountries = '''
  query GetCountries() {
    countries {
    name
    native
    capital
    code
    emoji
    currency
    }
  }
''';

  static const String getSingleCountry = r'''
         query GetCountryById($code:ID!){
         country(code: $code) {
         name native
         continent{ code }
         capital
         emoji
         currency
         emojiU
         awsRegion
         phones
         languages {
            code
           name
         }
       }
      }
        ''';
}
