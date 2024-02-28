import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_datas_model.dart';
import 'package:gamev2/models/country_model.dart';
import 'package:gamev2/models/presidential_debate_model.dart';
import 'package:gamev2/models/presidential_debate_responses_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class CountriesRepo {
  final _database = DatabaseHelper.instance.database;
  final table = 'countries';
  Future<List<CountryModel>> readCountries(String continent) async {
    final db = await _database;
    try {
      final countries = await db.rawQuery(
          'SELECT * from $table where continent_name = ? AND is_playable = 1',
          [continent]);

      return countries.map((e) => CountryModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while reading countries: $e');
      rethrow;
    }
  }



  Future<List<Map<String, dynamic>>> getCountries(
      String continent, int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final countries = await db.rawQuery(
          "SELECT "
          "countries.id as c_id, $table.*, "
          "persons.first_name, persons.last_name, persons.image_path AS person_image_path, persons.like_me_percent, "
          "diplomaties.*, "
          "country_relations.* "
          "FROM countries "
          "JOIN persons ON countries.president_id = persons.id "
          "JOIN diplomaties ON countries.id = diplomaties.country_id "
          "JOIN country_relations ON country_relations.country2_id = countries.id "
          "WHERE countries.continent_name = ? and countries.id IS NOT ? and diplomaties.country_2_id = ?",
          [continent, id, id]);
      return countries;
    } catch (e) {
      print('Error occurred while reading countries: $e');
      rethrow;
    }
  }

Future<Map<String, Object?>> getCountriesInfo(int id) async {
  final current = CreateNewGameController.to.currentSaveGame.value;
  final db = await DatabaseHelper.instance.currentDatabase(current);

  try {
    final info = await db.rawQuery(
      "SELECT "
      "country_info.*, map_img_path, name, currency, population_number, pib_amount "
      "FROM country_info "
      "JOIN countries ON country_info.country_id = countries.id "
      "JOIN country_datas ON country_info.country_id = country_datas.country_id "
      "WHERE country_info.country_id = ?",
      [id]
    );
    return info.isNotEmpty ? info[0] : <String, Object?>{};
  } catch (e) {
    print('Error occurred while reading countries: $e');
    rethrow;
  }
}


  Future<CountryDatasModel> getCountryDatas(int countryId) async {
    final db = await _database;

    try {
      final data = await db.rawQuery(
          "SELECT population_number, median_salary, military_number, pib_amount, total_economy_amount FROM country_datas JOIN countries ON country_datas.country_id = $countryId");
      final list = data.map((e) => CountryDatasModel.fromMap(e)).toList();

      return list[0];
    } catch (e) {
      // Handle the error appropriately
      return CountryDatasModel(
        id: 0,
        country_id: 0,
        pollution_taux: 0,
        security_taux: 0,
        education_taux: 0,
        healthy_taux: 0,
        stability_int_taux: 0,
        stability_int_taux_per_round: 0,
        stability_international_taux: 0,
        justicy_taux: 0,
        justicy_taux_per_round: 0,
        smic_salary_amount: 0,
        population_number_per_round: 0,
        pollution_taux_per_round: 0,
        security_taux_per_round: 0,
        education_taux_per_round: 0,
        healthy_taux_per_round: 0,
        total_economy_amount_per_round: 0,
        stability_international_taux_per_round: 0,
        pib_amount_per_round: 0,
        population_number: 0,
        median_salary: 0,
        military_number: 0,
        pib_amount: 0,
        total_economy_amount: 0,
      );
    }
  }

  Future<String> getIdeology(int countryId) async {
    final db = await _database;

    try {
      final ideology = await db.rawQuery(
          "SELECT political_ideology_pourcentage_parlement FROM $table WHERE id = $countryId");
      return ideology[0]['political_ideology_pourcentage_parlement'].toString();
    } catch (e) {
      print('Error occurred while fetching ideology: $e');
      return 'Error! Failed to fetch ideology';
    }
  }

  Future<List<Map<String, dynamic>>> getElectionCandidates(
      int countryId) async {
    final db = await _database;
    try {
      final list = await db.rawQuery(
        "SELECT president_election_candidates.*, persons.id AS person_id, persons.* FROM president_election_candidates JOIN persons ON president_election_candidates.person_id = persons.id WHERE persons.country_id = ?",
        [countryId],
      );
      return list;
    } catch (e) {
      print('Error occurred while fetching election candidates: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<PresidentialDebateModel>> getDebates() async {
    final db = await _database;

    try {
      final list = await db.rawQuery("SELECT * FROM presidential_debates");

      return list.map((e) => PresidentialDebateModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while fetching debates: $e');
      return <PresidentialDebateModel>[];
    }
  }

  Future<List<PresidentialDebateResponsesModel>> getDebateResponses(
      int id) async {
    final db = await _database;
    try {
      final list = await db.rawQuery(
          "SELECT * FROM presidential_debates_responses where presidential_debate_id = $id");

      return list
          .map((e) => PresidentialDebateResponsesModel.fromMap(e))
          .toList();
    } catch (e) {
      print('Error occurred while fetching debate responses: $e');
      return <PresidentialDebateResponsesModel>[];
    }
  }

  Future<List<CountryModel>> getCurrency() async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT * FROM countries GROUP BY currency ORDER BY currency_taux");

      return list.map((e) => CountryModel.fromMap(e)).toList();
    } catch (e) {
      print('Error occurred while fetching debate responses: $e');
      return <CountryModel>[];
    }
  }
}
