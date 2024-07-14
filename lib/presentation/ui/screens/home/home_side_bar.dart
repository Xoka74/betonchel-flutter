import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/res/colors/app_colors.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/components/cubits/auth/auth_cubit.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeSideBar extends StatefulWidget {
  const HomeSideBar({super.key});

  @override
  State<HomeSideBar> createState() => _HomeSideBarState();
}

class _HomeSideBarState extends State<HomeSideBar> {
  late int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    final pages = [
      const ApplicationListPage(),
      const EmployeesListPage(),
      const ConcreteGradeListPage(),
    ];

    return NavigationRail(
      selectedLabelTextStyle: const TextStyle(color: AppColors.blue),
      selectedIconTheme: const IconThemeData(color: AppColors.blue),
      extended: true,
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });

        context.router.replaceAll([pages[index]]);
      },
      leading: const Image(
        image: AssetImage(Assets.imagesLogo),
        width: 150,
        height: 150,
      ),
      destinations: [
        NavigationRailDestination(
          label: Text(
            strings.orders,
            style: const TextStyle(fontSize: 16),
          ),
          icon: SvgPicture.asset(
            Assets.iconsDocs,
            height: 24,
            width: 24,
            colorFilter: _selectedIndex == 0 ? const ColorFilter.mode(
              AppColors.blue,
              BlendMode.srcIn,
            ) : null,
          ),
        ),
        NavigationRailDestination(
          label: Text(
            strings.employees,
            style: const TextStyle(fontSize: 16),
          ),
          icon: const Icon(Icons.person),
        ),
        NavigationRailDestination(
          label: Text(
            strings.goods,
            style: const TextStyle(fontSize: 16),
          ),
          icon: SvgPicture.asset(
            Assets.iconsBox,
            height: 24,
            width: 24,
            colorFilter: _selectedIndex == 2 ? const ColorFilter.mode(
              AppColors.blue,
              BlendMode.srcIn,
            ) : null,
          ),
        ),
      ],
      trailing: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Column(
            children: [
              const Spacer(),
              PrimaryButton(
                onPressed: context.read<AuthCubit>().logout,
                iconStart: Assets.iconsLeave,
                child: Text(strings.logout),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
