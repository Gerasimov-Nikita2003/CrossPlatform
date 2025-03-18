// import 'package:news_brief/domain/domain.dart';
// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';
// import 'package:news_brief/app/app.dart';

// class ArticleCardInfo extends StatelessWidget {
//   final Article article;
//   const ArticleCardInfo({
//     super.key,
//     required this.article,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         // для следующей лабораторной работы
//         context.go('/home/article/1');
//       },
//       borderRadius: BorderRadius.circular(5),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [

//                                 Text(
//                   "Имя:",
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 Text(
//                   article.name,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   //style: Theme.of(context).textTheme.titleLarge,
//                   style: const TextStyle(
//                     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                   ),
//                 ),
//                                 Text(
//                   "Описание:",
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 Text(
//                   article.description,
//                   maxLines: 5,
//                   overflow: TextOverflow.ellipsis,
//                   //style: Theme.of(context).textTheme.titleLarge,
//                   style: const TextStyle(
//                     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                   ),
//                 ),
//                                 Text(
//                   "Первое появление:",
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 Text(
//                   article.firstAppearance,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   //style: Theme.of(context).textTheme.titleLarge,
//                   style: const TextStyle(
//                     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                   ),
//                 ),
//                                 Text(
//                   "Создатель:",
//                   style: Theme.of(context).textTheme.titleLarge,
//                 ),
//                 Text(
//                   article.creator,
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                   //style: Theme.of(context).textTheme.titleLarge,
//                   style: const TextStyle(
//                     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                   ),
//                 ),
//                 //                 Text(
//                 //   "Охлаждение:",
//                 //   style: Theme.of(context).textTheme.titleLarge,
//                 // ),
//                 // Text(
//                 //   article.cooling,
//                 //   maxLines: 1,
//                 //   overflow: TextOverflow.ellipsis,
//                 //   //style: Theme.of(context).textTheme.titleLarge,
//                 //   style: TextStyle(
//                 //     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                 //   ),
//                 // ),
//                 //                 Text(
//                 //   "КПП:",
//                 //   style: Theme.of(context).textTheme.titleLarge,
//                 // ),
//                 // Text(
//                 //   article.gearbox,
//                 //   maxLines: 1,
//                 //   overflow: TextOverflow.ellipsis,
//                 //   //style: Theme.of(context).textTheme.titleLarge,
//                 //   style: TextStyle(
//                 //     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                 //   ),
//                 // ),
//                 //                 Text(
//                 //   "Привод:",
//                 //   style: Theme.of(context).textTheme.titleLarge,
//                 // ),
//                 // Text(
//                 //   article.transmission,
//                 //   maxLines: 1,
//                 //   overflow: TextOverflow.ellipsis,
//                 //   //style: Theme.of(context).textTheme.titleLarge,
//                 //   style: TextStyle(
//                 //     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                 //   ),
//                 // ),
//                 //                                 Text(
//                 //   "Вес:",
//                 //   style: Theme.of(context).textTheme.titleLarge,
//                 // ),
//                 // Text(
//                 //   article.total_weight,
//                 //   maxLines: 1,
//                 //   overflow: TextOverflow.ellipsis,
//                 //   //style: Theme.of(context).textTheme.titleLarge,
//                 //   style: TextStyle(
//                 //     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                 //   ),
//                 // ),
//                 //                                 Text(
//                 //   "Топливный бак:",
//                 //   style: Theme.of(context).textTheme.titleLarge,
//                 // ),
//                 // Text(
//                 //   article.fuel_capacity,
//                 //   maxLines: 1,
//                 //   overflow: TextOverflow.ellipsis,
//                 //   //style: Theme.of(context).textTheme.titleLarge,
//                 //   style: TextStyle(
//                 //     fontSize: 20, // Задайте здесь желаемый размер шрифта
//                 //   ),
//                 // ),
//                 5.ph,
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }