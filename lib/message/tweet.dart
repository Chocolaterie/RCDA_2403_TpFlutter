import 'package:json_annotation/json_annotation.dart';

part 'tweet.g.dart';

@JsonSerializable()
class Tweet {
  int id;
  String profile;
  int created_date;
  String author;
  String message;

  Tweet(this.id, this.profile, this.created_date, this.author, this.message);

  String displayPostDate(){
    // Convertir le timestamp en objet DateTime
    DateTime dateTime =
    DateTime.fromMillisecondsSinceEpoch(created_date * 1000);

    // Calculer la différence entre la date actuelle et le timestamp
    Duration difference = DateTime.now().difference(dateTime);

    // Si la différence est négative (timestamp dans le futur), retourner une chaîne vide
    if (difference.isNegative) {
      return '';
    }

    // Afficher le format approprié en fonction de la durée écoulée
    if (difference.inDays > 0) {
      return '${difference.inDays}d';
    }
    if (difference.inHours > 0) {
      return '${difference.inHours}h';
    }
    if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m';
    }
    return '${difference.inSeconds}s';
  }

  factory Tweet.fromJson(Map<String, dynamic> json) => _$TweetFromJson(json);

  Map<String, dynamic> toJson() => _$TweetToJson(this);
}