import 'package:betonchel_manager/domain/models/concrete/concrete_grade.dart';
import 'package:betonchel_manager/utils/extensions/concrete_grade_extension.dart';
import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class ConcreteGradeItem extends StatelessWidget {
  final ConcreteGrade concreteGrade;
  final Function(ConcreteGrade)? onTap;

  const ConcreteGradeItem({
    super.key,
    required this.concreteGrade,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(12.0);
    final strings = context.strings;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => onTap?.call(concreteGrade),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: Text(
                      concreteGrade.shortTitle(strings),
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                children: [
                  Text(
                    strings.clazz,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    concreteGrade.clazz,
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    strings.frostResistance,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    concreteGrade.frostResistanceType ?? '-',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    strings.waterproof,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    concreteGrade.waterproofType ?? '-',
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    strings.pricePerCubicMeter,
                    style: const TextStyle(fontSize: 14),
                  ),
                  const Spacer(),
                  Text(
                    strings.nRoubles(concreteGrade.priceForCube),
                    style: const TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              const Divider(height: 1),
            ],
          ),
        ),
      ),
    );
  }
}
