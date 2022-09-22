import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/localization/l10n.dart';
import 'package:makerre_flutter/bloc/auth/auth_bloc.dart';
import 'package:makerre_flutter/configs/router.dart';
import 'package:makerre_flutter/configs/theme.dart';
import 'package:makerre_flutter/repositories/auth_repository.dart';
import 'package:makerre_flutter/repositories/user_repository.dart';
import 'package:makerre_flutter/services/storage_service.dart';
import 'package:makerre_flutter/simple_bloc_observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final StorageService _storageService = StorageService();

  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => AuthRepositories(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthBloc(
              authRepositories: context.read<AuthRepositories>(),
              storageService: _storageService,
              userRepository: context.read<UserRepository>(),
            ),
          )
        ],
        child: MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: theme(),
          routeInformationProvider: AppRouter.router.routeInformationProvider,
          routeInformationParser: AppRouter.router.routeInformationParser,
          routerDelegate: AppRouter.router.routerDelegate,
          supportedLocales: const [
            Locale('en'),
            Locale('ko'),
          ],
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            FormBuilderLocalizations.delegate,
          ],
        ),
      ),
    );
  }
}
