import 'package:flutter/material.dart';
import 'package:provider_architecture/viewmodel_provider.dart';
import 'package:the_basics/viewmodels/episode_details_view_model.dart';

class EpisodeDetails extends StatelessWidget {
  final int id;
  const EpisodeDetails({Key key, this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelProvider<EpisodeDetailsViewModel>.withConsumer(
      viewModel: EpisodeDetailsViewModel(),
      onModelReady: (model) => model.getEpisodeData(id),
      builder: (context, model, child) => Center(
        child: Column(
          children: <Widget>[
            model.episode == null
                ? Container()
                : SizedBox(
                    height: 320,
                    child: Image.network(
                      model.episode.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
            model.episode == null
                ? CircularProgressIndicator()
                : Text(
                    model.episode.title,
                    style: TextStyle(fontSize: 60),
                  ),
          ],
        ),
      ),
    );
  }
}
