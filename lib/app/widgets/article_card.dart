import 'package:myaplication/data/endpoints.dart';
import 'package:myaplication/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:myaplication/app/app.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    super.key,
    required this.article,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
            color: const Color.fromARGB(255, 248, 205, 205), width: 1),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: () {
          // для следующей лабораторной работы
          Endpoints.getById =
              Endpoints.getById.replaceAll('id', article.id.toString());
          context.go('/home/article/${article.id.toString()}');
        },
        borderRadius: BorderRadius.circular(5),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      //Image.asset('img2.png', width: 50,),
                      Text(
                        article.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      40.ph,
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
