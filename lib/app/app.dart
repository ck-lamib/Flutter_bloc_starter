import 'package:clean_folder_str/datasource/base_services.dart';
import 'package:clean_folder_str/datasource/local/localuserauthservice/local_user_auth_service.dart';
import 'package:clean_folder_str/datasource/remote/login/login_service.dart';
import 'package:clean_folder_str/screens/authentication/bloc/authentication_bloc.dart';
import 'package:clean_folder_str/screens/authentication/data/repository/authentication_repo_impl.dart';
import 'package:clean_folder_str/screens/authentication/domain/repository/authentication_repo.dart';
import 'package:clean_folder_str/screens/authentication/domain/usecase/authentication_usecase.dart';
import 'package:clean_folder_str/screens/login/data/repository/login_repository_impl.dart';
import 'package:clean_folder_str/screens/login/domain/repository/login_repository.dart';
import 'package:clean_folder_str/screens/login/domain/usecase/login_usecase.dart';
import 'package:clean_folder_str/screens/splash/views/splash_screen.dart';
import 'package:clean_folder_str/utils/helpers/connectivitybloc/connectivity_bloc.dart';
import 'package:clean_folder_str/utils/routes/app_routes.dart';
import 'package:clean_folder_str/utils/theme/colors.dart';
import 'package:clean_folder_str/utils/theme/theme_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyDemoApp extends StatelessWidget {
  const MyDemoApp({
    super.key,
    required SharedPreferences sharedPreferences,
  }) : _sharedPreferences = sharedPreferences;

  final SharedPreferences _sharedPreferences;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        _configureLocalUserService(),
        _baseRemoteService(),

        //auth
        _configureAuthenticationRepository(),
        _configureAuthenticationUseCase(),

        //login services
        _configureLoginService(),
        _configureLoginRepository(),
        _configureLoginUseCase(),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConnectivityBloc(),
          ),
          BlocProvider(
            create: (context) => AuthenticationBloc(
                authenticationUseCase:
                    RepositoryProvider.of<AuthenticationUseCase>(context))
              ..add(const AuthenticationStatusChanged()),
          ),
        ],
        child: const HrmAppView(),
      ),
    );
  }

//local user services
  RepositoryProvider<LocalUserAuthService> _configureLocalUserService() {
    LocalUserAuthService localUserService =
        LocalUserAuthServiceImpl(sharedPreferences: _sharedPreferences);
    return RepositoryProvider.value(
      value: localUserService,
    );
  }

  //for base service
  RepositoryProvider<BaseRemoteServices> _baseRemoteService() {
    return RepositoryProvider(
      create: (context) => BaseRemoteServices(
        localUserAuthService:
            RepositoryProvider.of<LocalUserAuthService>(context),
      ),
      lazy: true,
    );
  }

//authentication
//auth- repo
  RepositoryProvider<AuthenticationRepository>
      _configureAuthenticationRepository() {
    return RepositoryProvider(
      create: (context) => AuthenticationRepositoryImpl(
        localUserAuthService:
            RepositoryProvider.of<LocalUserAuthService>(context),
      ),
      lazy: true,
    );
  }

  //authentication-usecase
  RepositoryProvider<AuthenticationUseCase> _configureAuthenticationUseCase() {
    return RepositoryProvider(
      create: (context) => AuthenticationUseCase(
        authenticationRepository:
            RepositoryProvider.of<AuthenticationRepository>(context),
      ),
      lazy: true,
    );
  }

  //login
  //login-services
  RepositoryProvider<LoginService> _configureLoginService() {
    return RepositoryProvider(
      create: (context) => LoginServiceImpl(
        baseRemoteServices: RepositoryProvider.of<BaseRemoteServices>(context),
      ),
    );
  }

//login-repo
  RepositoryProvider<LoginRepository> _configureLoginRepository() {
    return RepositoryProvider(
      create: (context) => LoginRepositoryImpl(
        loginService: RepositoryProvider.of<LoginService>(context),
      ),
      lazy: true,
    );
  }

//login-usecase
  RepositoryProvider<LoginUseCase> _configureLoginUseCase() {
    return RepositoryProvider(
      create: (context) => LoginUseCase(
        localUserService: RepositoryProvider.of<LocalUserAuthService>(context),
        loginRepository: RepositoryProvider.of<LoginRepository>(context),
      ),
      lazy: true,
    );
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
GlobalKey<ScaffoldMessengerState> scaffoldKey =
    GlobalKey<ScaffoldMessengerState>();

class HrmAppView extends StatelessWidget {
  const HrmAppView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: MyAppColors.primarycolor, // status bar color
        statusBarIconBrightness: Brightness.light,
      ),
    );
    return MaterialApp(
      title: "Hrm App",
      navigatorKey: navigatorKey,
      scaffoldMessengerKey: scaffoldKey,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      debugShowCheckedModeBanner: false,
      // supportedLocales: AppLocalizations.supportedLocales,
      onGenerateRoute: onGenerateRoute,
      initialRoute: SplashScreen.routeName,
      theme: MyAppTheme.lightTheme,
      darkTheme: MyAppTheme.lightTheme,
    );
  }
}
