// Package imports:
import 'package:app_demo/application/auth/login/login_bloc.dart';
import 'package:app_demo/application/home/home_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import 'di.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
void setupServiceLocator() => getIt.init();

final loginBloc = getIt<LoginBloc>();
final homeBloc = getIt<HomeBloc>();