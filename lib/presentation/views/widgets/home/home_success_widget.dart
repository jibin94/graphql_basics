import 'package:flutter/material.dart';
import 'package:graphql_basics/domain/models/country/countries.dart';
import 'package:graphql_basics/presentation/views/screens/details_page.dart';

class HomeSuccessWidget extends StatelessWidget {
  final List<CountryModel> list;

  const HomeSuccessWidget({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      itemCount: list.length,
      shrinkWrap: true,
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailsPage(code: list[index].code),
            ),
          );
        },
        child: Card(
          color: Colors.white,
          child: ListTile(
            title: Text(list[index].name),
            subtitle: Text("Capital: ${list[index].capital}"),
          ),
        ),
      ),
    );
  }
}
