import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_basics/domain/repository/home/home_repository.dart';
import 'package:graphql_basics/presentation/bloc/detail_page/details_bloc.dart';
import 'package:graphql_basics/presentation/views/widgets/home/home_failure_widget.dart';
import 'package:graphql_basics/presentation/views/widgets/loading_widget.dart';
import 'package:graphql_basics/utils/constants.dart';

class DetailsPage extends StatefulWidget {
  final String code;

  const DetailsPage({super.key, required this.code});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          AppConstants.appBarTitle1,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: BlocProvider(
        create: (context) => DetailsBloc(GetIt.I<APIRepository>())
          ..add(FetchDetailsDataEvent(code: widget.code)),
        child:
            BlocBuilder<DetailsBloc, DetailsState>(builder: (context, state) {
          switch (state.runtimeType) {
            case DetailsSuccess:
              var st = state as DetailsSuccess;
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(st.list.name),
                    Text("Capital: ${st.list.capital}"),
                    Text("Currency: ${st.list.currency}"),
                    Text("Emoji: ${st.list.emoji}"),
                  ],
                ),
              );

            case DetailsFailure:
              return const HomeFailureWidget();
          }
          return const LoadingWidget();
        }),
      ),
    );
  }
}
