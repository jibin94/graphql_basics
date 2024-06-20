import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql/client.dart';
import 'package:graphql_basics/data/data_sources/api_services.dart';
import 'package:graphql_basics/domain/models/country/countries.dart';
import 'package:graphql_basics/domain/repository/home/home_repository.dart';
import 'package:graphql_basics/utils/remote_query.dart';

import '../../../domain/models/country/country_detail_model.dart';

class HomeRepositoryImpl implements APIRepository {
  ApiServices apiServices = GetIt.I<ApiServices>();

  @override
  Future<List<CountryModel>?> getCountries() async {
    try {
      QueryResult queryResult =
          await apiServices.fetchFromQuery(query: RemoteQuery.getCountries);
      if (queryResult.data != null) {
        List<CountryModel> countries = (queryResult.data!['countries'] as List)
            .map(
                (dynamic e) => CountryModel.fromJson(e as Map<String, dynamic>))
            .toList();
        return countries;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }

  @override
  Future<CountryDetailModel?> getCountryById(String code) async {
    try {
      QueryResult queryResult = await apiServices.fetchFromQuery(
        query: RemoteQuery.getSingleCountry,
        variable: {'code': code},
      );
      if (queryResult.data != null) {
        debugPrint(queryResult.data.toString());
        Map<String, dynamic> data =
            queryResult.data!['country'] as Map<String, dynamic>;
        CountryDetailModel countryDetailModel =
            CountryDetailModel.fromJson(data);
        return countryDetailModel;
      } else {
        return null;
      }
    } catch (error) {
      rethrow;
    }
  }
}
