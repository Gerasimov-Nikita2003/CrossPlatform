import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myaplication/app/app.dart';
import 'package:myaplication/app/features/favourites/bloc/favourites_bloc.dart';
import 'package:myaplication/di/di.dart';
import 'package:myaplication/domain/domain.dart';
//import 'package:news_brief/domain/repository/model%20info/article1.dart';
import 'package:flutter/widgets.dart';
//import 'package:go_router/go_router.dart';
import 'package:myaplication/domain/repository/top_news_info/CharacterRepository.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class InfoScreen extends StatefulWidget {
  const InfoScreen({super.key});

  @override
  State<InfoScreen> createState() => _InfoScreenState();
}

class _InfoScreenState extends State<InfoScreen> {
  final _infoBloc = InfoBloc(getIt<CharacterRepository>());
  final _favouritesBloc = getIt<FavouritesBloc>();

  bool _isFavourite = false;

  @override
  void initState() {
    _infoBloc.stream.listen((state) {
      if (state is InfoLoadSuccess) {
        _checkIfFavourite(state.articles.id);
      }
    });
    super.initState();
    _infoBloc.add(const InfoLoad());
  }

  void _toggleFavourite(Article article) {
    if (_isFavourite) {
      _favouritesBloc.add(FavouritesDelete(article.name));
    } else {
      _favouritesBloc.add(FavouritesAdd(
        id: article.id,
        name: article.name,
        release: article.release,
        imdbRating: article.imdbRating,
        timing: article.timing,
        description: article.description,
      ));
    }
    setState(() {
      _isFavourite = !_isFavourite;
    });
  }

  Future<void> _checkIfFavourite(int id) async {
    final CollectionReference favorites =
        FirebaseFirestore.instance.collection('favorites');

    try {
      QuerySnapshot snapshot = await favorites
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('favourites')
          .get();

      bool isFavourite = snapshot.docs
          .map((doc) => doc.data() as Map<String, dynamic>)
          .toList()
          .any((favorite) => favorite['id'] == id);

      setState(() {
        _isFavourite = isFavourite;
      });
    } on FirebaseException catch (e) {
      throw e.message.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Details',
        ),
        actions: [
          BlocBuilder<InfoBloc, InfoState>(
            bloc: _infoBloc,
            builder: (context, state) {
              return IconButton(
                icon: Icon(
                  _isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavourite ? Colors.red : null,
                ),
                onPressed: () {
                  if (state is InfoLoadSuccess) {
                    Article articles = state.articles;
                    _toggleFavourite(articles);
                  }
                },
              );
            },
          ),
        ],
      ),
      body: BlocBuilder<InfoBloc, InfoState>(
        bloc: _infoBloc,
        builder: (context, state) {
          if (state is InfoLoadInProgress) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is InfoLoadSuccess) {
            Article articles = state.articles;

            //_isFavourite = _favouritesBloc.add(CheckFavoriteEvent(articles.id));
            //_checkIfFavourite(articles.id);

            return SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Name: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  //20.ph,
                  Text(
                    articles.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  10.ph,
                  Text(
                    "Release: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    articles.release,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  10.ph,
                  Text(
                    "IMDB Rating: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    articles.imdbRating,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  10.ph,
                  Text(
                    "Timing: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    articles.timing,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    "Description: ",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    articles.description,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            );
          }
          if (state is InfoLoadFailure) {
            return ErrorCardInfo(
              title: 'Error',
              description: state.exception.toString(),
              onReload: () {
                _infoBloc.add(const InfoLoad());
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class ErrorCardInfo extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onReload;

  const ErrorCardInfo({
    super.key,
    required this.title,
    required this.description,
    required this.onReload,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Card(
          child: Column(
            children: [
              Text(title),
              Text(description),
              ElevatedButton(
                onPressed: onReload,
                child: const Text('Reload'),
              ),
            ],
          ),
        ));
  }
}
