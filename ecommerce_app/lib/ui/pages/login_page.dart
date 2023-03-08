import 'package:ecommerce_app/util/auth_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/authentication/auth_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                context.read<AuthBloc>().add(
                      AuthRequest('tasbeat', 'Alialirahimi12'),
                    );
                var token = AuthManager.getToken();
                print(token);
              },
              child: const Text('login'),
            ),
            ElevatedButton(
              onPressed: () async {
                AuthManager.logout();
                print('logged out');
              },
              child: const Text('logout'),
            ),
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                if (state is AuthInitial) {
                  return const Text('لطفا وارد شوید');
                }
                if (state is AuthResponseInProgress) {
                  return const CircularProgressIndicator();
                }
                if (state is AuthResponseSuccess) {
                  Text eitherTextWidget = const Text('');
                  state.response.fold((l) {
                    eitherTextWidget = Text(l);
                  }, (r) {
                    eitherTextWidget = Text(r);
                  });
                  return eitherTextWidget;
                }
                return const Text('خطایی رخ داده است');
              },
            )
          ],
        ),
      ),
    );
  }
}
