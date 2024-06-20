import 'package:graphql_basics/domain/models/country/countries.dart';
import 'package:graphql_basics/domain/models/country/country_detail_model.dart';

abstract class APIRepository {
  Future<List<CountryModel>?> getCountries();
  Future<CountryDetailModel?> getCountryById(String code);
}
