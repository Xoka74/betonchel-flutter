import 'package:auto_route/auto_route.dart';
import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/navigation/app_router.gr.dart';
import 'package:betonchel_manager/presentation/res/assets/assets.dart';
import 'package:betonchel_manager/presentation/ui/components/buttons/primary_button.dart';
import 'package:betonchel_manager/presentation/ui/screens/concrete_grade/concrete_grade_list/components/concrete_grade_item.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ConcreteGradeListContent extends StatelessWidget {
  final List<ConcreteGrade> concreteGrades;
  final Function(ConcreteGrade) onConcreteGradeClicked;

  const ConcreteGradeListContent({
    super.key,
    required this.concreteGrades,
    required this.onConcreteGradeClicked,
  });

  @override
  Widget build(BuildContext context) {
    final strings = context.strings;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              PrimaryButton(
                onPressed: () => context.router.navigate(const NewConcreteGradePage()),
                iconStart: Assets.iconsAddCircle,
                child: Text(strings.newGood),
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ResponsiveGridView.builder(
              gridDelegate: const ResponsiveGridDelegate(
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                minCrossAxisExtent: 250,
              ),
              itemCount: concreteGrades.length,
              itemBuilder: (context, index) => ConcreteGradeItem(
                onTap: onConcreteGradeClicked,
                concreteGrade: concreteGrades[index],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
