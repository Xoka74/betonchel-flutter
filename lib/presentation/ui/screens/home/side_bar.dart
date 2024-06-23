// import 'package:betonchel_manager/utils/extensions/context_extensions.dart';
// import 'package:flutter/cupertino.dart';
//
// class SideBar extends StatelessWidget {
//   final Widget leading;
//   final Widget trailing;
//   final ValueChanged<int>? onDestinationSelected;
//   final List<String> items;
//
//   const SideBar({
//     super.key,
//     required this.leading,
//     required this.trailing,
//     this.onDestinationSelected,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     final strings = context.strings;
//     return Column(
//       children: [
//         leading,
//         Text(
//           strings.applications,
//           style: const TextStyle(fontSize: 16),
//         ),
//         Text(
//           strings.employees,
//           style: const TextStyle(fontSize: 16),
//         ),
//         Text(
//           strings.goods,
//           style: const TextStyle(fontSize: 16),
//         ),
//         trailing,
//       ],
//     );
//   }
// }
