import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_cubit.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/user/user_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserListener extends StatelessWidget {
  final Widget child;

  const UserListener({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<UserCubit, UserState>(
      listener: (context, state) async {
        // if (state is UserLoadedState){
        //    return context.router.replaceAll([const HomeRootPage()]);
        // }
        //
        // return context.router.replaceAll([const LoadingPage()]);
      },
      child: child,
    );
  }
}
