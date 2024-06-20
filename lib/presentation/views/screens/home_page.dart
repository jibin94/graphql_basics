import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:graphql_basics/domain/repository/home/home_repository.dart';
import 'package:graphql_basics/presentation/bloc/home/home_bloc.dart';
import 'package:graphql_basics/presentation/views/widgets/home/home_failure_widget.dart';
import 'package:graphql_basics/presentation/views/widgets/home/home_success_widget.dart';
import 'package:graphql_basics/presentation/views/widgets/loading_widget.dart';
import 'package:graphql_basics/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: const Text(
          AppConstants.appBarTitle,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            HomeBloc(GetIt.I<APIRepository>())..add(FetchHomeDataEvent()),
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          switch (state.runtimeType) {
            case HomeSuccess:
              var st = state as HomeSuccess;
              return HomeSuccessWidget(
                list: st.list,
              );
            case HomeFailure:
              return const HomeFailureWidget();
          }
          return const LoadingWidget();
        }),
      ),
    );
  }
}
