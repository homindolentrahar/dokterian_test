import 'package:dokterian_test/app_injection.dart';
import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/core/router/app_router.dart';
import 'package:dokterian_test/core/ui/widget/app_button.dart';
import 'package:dokterian_test/core/ui/widget/app_text_field.dart';
import 'package:dokterian_test/feature/auth/domain/repository/auth_repository.dart';
import 'package:dokterian_test/feature/auth/presentation/bloc/auth_cubit.dart';
import 'package:dokterian_test/feature/auth/presentation/login/bloc/login_cubit.dart';
import 'package:dokterian_test/feature/auth/presentation/login/bloc/login_state.dart';
import 'package:dokterian_test/generated/assets.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage._();

  @override
  State<LoginPage> createState() => _LoginPageState();

  static Widget createPage() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => LoginCubit(
              authRepository: injector.get<AuthRepository>(),
            ),
          )
        ],
        child: const LoginPage._(),
      );
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginCubit>();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: FormBuilder(
            key: controller.formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 80,
              ),
              child: BlocConsumer<LoginCubit, LoginState>(
                  listener: (listenerCtx, state) {
                if (state.status == BaseStatus.failure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Theme.of(context).colorScheme.error,
                    ),
                  );
                } else if (state.status == BaseStatus.success) {
                  listenerCtx.read<AuthCubit>().authenticate(state.data ?? "");

                  context.go(RoutePaths.main);
                }
              }, builder: (builderCtx, state) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.images.loginImage.path,
                      width: 200,
                      height: 200,
                    ),
                    const SizedBox(height: 6),
                    Text(
                      "Kesehatan adalah aset berharga",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                    ),
                    const SizedBox(height: 56),
                    AppTextField(
                      isEnabled: state.status != BaseStatus.loading,
                      name: "username",
                      hint: "Username",
                      icon: SvgPicture.asset(
                        Assets.icons.icUsername,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      inputAction: TextInputAction.next,
                      inputType: TextInputType.name,
                      validators: [
                        FormBuilderValidators.minLength(4),
                      ],
                    ),
                    const SizedBox(height: 40),
                    AppTextField(
                      isEnabled: state.status != BaseStatus.loading,
                      name: "password",
                      hint: "Password",
                      isObscure: true,
                      icon: SvgPicture.asset(
                        Assets.icons.icPassword,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      inputType: TextInputType.visiblePassword,
                      validators: [
                        FormBuilderValidators.minLength(
                          8,
                          errorText: "Password must be at least 8 characters",
                        ),
                        FormBuilderValidators.match(
                          r'^(?=.*?[a-z])(?=.*?[0-9]).{8,}$',
                          errorText:
                              "Password does not meet the requirements:\n1 Lowercase\n1 Number",
                        ),
                      ],
                    ),
                    const SizedBox(height: 80),
                    AppButton(
                      isEnabled: state.status != BaseStatus.loading,
                      title: "Masuk",
                      onPressed: () {
                        controller.login();
                      },
                    ),
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
