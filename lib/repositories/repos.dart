import 'package:gamev2/repositories/countries_repo.dart';
import 'package:gamev2/repositories/country_datas_repo.dart';
import 'package:gamev2/repositories/country_laws.dart';
import 'package:gamev2/repositories/current_game_repo.dart';
import 'package:gamev2/repositories/news_repo.dart';
import 'package:gamev2/repositories/game_repo.dart';
import 'package:gamev2/repositories/elections_repo.dart';
import 'package:gamev2/repositories/jobs_repo.dart';
import 'package:gamev2/repositories/messages_repo.dart';
import 'package:gamev2/repositories/ministers_repo.dart';
import 'package:gamev2/repositories/president_promises_repo.dart';

class Repos {
  /// Repository
  static final countriesRepo = CountriesRepo();
  static final gameRepo = GameRepo();
  static final countryDatasRepo = CountryDatasRepo();
  static final countryminstersRepo = CountryMinistersRepo();
  static final currentGameRepo = CurrentGameRepo();
  static final countryLawsRepo = CountryLawsRepo();
  static final eventsRepo = NewsRepo();
  static final messagesRepo = MessagesRepo();
  static final jobsRepo = JobsRepo();
  static final presidentpromisesRepo = PresidentPromisesRepo();
  
  static final elections = ElectionsRepo();

  /// Singleton factory
  static final Repos _instance = Repos._internal();

  factory Repos() {
    return _instance;
  }
  Repos._internal();
}
