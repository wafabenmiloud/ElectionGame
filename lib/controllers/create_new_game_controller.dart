// ignore_for_file: prefer_null_aware_operators

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:gamev2/models/country_model.dart';
import 'package:gamev2/models/games_model.dart';
import 'package:gamev2/models/language_mode.dart';
import 'package:gamev2/models/person_model.dart';
import 'package:gamev2/models/political_parties_model.dart';
import 'package:gamev2/models/president_election_candidates_model.dart';
import 'package:gamev2/models/president_promises_model.dart';
import 'package:gamev2/models/presidential_debate_model.dart';
import 'package:gamev2/models/presidential_debate_responses_model.dart';
import 'package:gamev2/models/promise_model.dart';
import 'package:gamev2/repositories/country_debts_repo.dart';
import 'package:gamev2/repositories/game_repo.dart';
import 'package:gamev2/repositories/jobs_repo.dart';
import 'package:gamev2/repositories/political_parties_repo.dart';
import 'package:gamev2/repositories/promises_repo.dart';
import 'package:gamev2/repositories/repos.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'navigation_controller.dart';

class CreateNewGameController extends GetxController {
  static CreateNewGameController get to => Get.find();
  final _countriesRepo = Repos.countriesRepo;
  final _gameRepo = GameRepo();
  final currentSaveGame = 'database'.obs;
  final currentLanguage = LanguageModel(
          imagePath: 'assets/france.svg', title: 'Français', languageCode: 'fr')
      .obs;
  RxList<PresidentialDebateModel> debates = <PresidentialDebateModel>[].obs;
  RxList<PresidentPromisesModel> presidentPromises =
      <PresidentPromisesModel>[].obs;
  RxMap<int, List<PresidentialDebateResponsesModel>> debateResponsesMap =
      <int, List<PresidentialDebateResponsesModel>>{}.obs;
  RxList<GamesModel> savedGames = <GamesModel>[].obs;
  RxList<CountryModel> countries = <CountryModel>[].obs;
  RxList<PromiseModel> promises = <PromiseModel>[].obs;
  RxList<PromiseModel> selectedpromises = <PromiseModel>[].obs;
  RxList<Map<String, dynamic>> partyPersonList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> candidatePersonList =
      <Map<String, dynamic>>[].obs;
  Rx<RxMap<String, dynamic>> randomCandidatePerson =
      RxMap<String, dynamic>().obs;
  RxList<Map<String, dynamic>> selectedparties = <Map<String, dynamic>>[].obs;
  RxMap selectedParti = {}.obs;

  final selectedContinent = 'Europe'.obs;
  final selectedCountryIndex = 0.obs;
  int _currentIndex = 0;

  final population = '0.0'.obs;
  final median_salary = 0.obs;
  final military_number = 0.obs;
  final pib_amount = 0.obs;
  final total_economy_amount = 0.obs;
  final dettes = 0.obs;
  final isMale = 0.obs;
  final name = TextEditingController();
  final prenom = TextEditingController();
  final dateN = TextEditingController();
  final imageUrl = 'assets/presidents/1.png'.obs;
  final job = ''.obs;

  void setSelectedParti(RxMap<String, dynamic> parti) {
    selectedParti.value = parti;
  }

  int calculateMoy() {
    int totalPoliticalDirection = 0;
    final selectedPromises = selectedpromises;
    if (selectedPromises.isEmpty) {
      return 0;
    }
    for (final promise in selectedPromises) {
      totalPoliticalDirection += promise.political_direction;
    }
    final moy = (totalPoliticalDirection / selectedPromises.length).round();

    return moy;
  }

  Future<void> selectPoliticalParties() async {
    final currentCountry = countries[selectedCountryIndex.value];

    final result = await PoliticalPartiesRepo()
        .getPoliticalPartiesAndPersons(currentCountry.id);
    for (final map in result) {
      final partyModel = PoliticalPartiesModel.fromMap(map);
      final personModel = PersonModel.fromMap(map);
      Map<String, dynamic> partyPersonData = {
        'party': partyModel,
        'person': personModel,
      };

      partyPersonList.add(partyPersonData);
    }
    for (final parti in partyPersonList) {
      if (parti['party'].political_direction <= (calculateMoy() + 10) &&
          parti['party'].political_direction >= (calculateMoy() - 10)) {
        selectedparties.add(parti);
      }
    }
  }

  Future<void> fetchAndRegroupDebateResponses() async {
    List<PresidentialDebateModel> allDebates =
        await _countriesRepo.getDebates();
    allDebates.shuffle();
    debates.value = allDebates.take(3).toList();
    for (var debate in debates) {
      final responses = await _countriesRepo.getDebateResponses(debate.id);
      debateResponsesMap[debate.id] = responses;
    }
  }

  Future<void> fetchPromises() async {
    promises.value = await PromisesRepo().getPromises();
  }

  Future<void> fetchJob(int id) async {
    job.value = await JobsRepo().getJobById(id);
  }

  Future<void> fetchCandidates(int id) async {
    final result = await _countriesRepo.getElectionCandidates(id);
    for (final map in result) {
      final candidateModel = PresidentElectionCandidatesModel.fromMap(map);
      final personModel = PersonModel.fromMap(map);
      Map<String, dynamic> candidatePersonData = {
        'candidate': candidateModel,
        'person': personModel,
      };
      candidatePersonList.add(candidatePersonData);
    }
    if (candidatePersonList.isNotEmpty) {
      final randomIndex = Random().nextInt(candidatePersonList.length);
      randomCandidatePerson.value =
          RxMap.from(candidatePersonList[randomIndex]);
    }
  }

  void init() async {
    savedGames.value = await _gameRepo.loadSavedGames();
    countries.value = await _countriesRepo.readCountries('Europe');
    if (countries.isNotEmpty) {
      dettes.value = await CountryDebtsRepo().getDettes(countries[0].id);
      final data = await _countriesRepo.getCountryDatas(countries[0].id);
      population.value = data.population_number.toString();
      median_salary.value = int.parse(data.median_salary.toString());
      military_number.value = int.parse(data.military_number.toString());
      pib_amount.value = int.parse(data.pib_amount.toString());
      total_economy_amount.value =
          int.parse(data.total_economy_amount.toString());
    } else {
      print('Error: Countries list is empty.');
    }
  }

  void loadSaveGame(String currentGame) {
    currentSaveGame.value = currentGame;
    DashboardController.to.init();
  }

  void changeContinent(String newContinent) async {
    selectedContinent.value = newContinent;
    selectedCountryIndex.value = 0;
    countries.value = await _countriesRepo.readCountries(newContinent);
    dettes.value = await CountryDebtsRepo().getDettes(countries[0].id);

    final data = await _countriesRepo.getCountryDatas(countries[0].id);
    population.value = data.population_number.toString();
    median_salary.value = int.parse(data.median_salary.toString());
    military_number.value = int.parse(data.military_number.toString());
    pib_amount.value = int.parse(data.pib_amount.toString());
    total_economy_amount.value =
        int.parse(data.total_economy_amount.toString());
  }

  void changeCountry(int newCountry) async {
    selectedCountryIndex.value = newCountry;
    final selectedCountryid = countries[newCountry].id;
    dettes.value = await CountryDebtsRepo().getDettes(selectedCountryid);

    final data = await _countriesRepo.getCountryDatas(selectedCountryid);
    population.value = data.population_number.toString();
    median_salary.value = int.parse(data.median_salary.toString());
    military_number.value = int.parse(data.military_number.toString());
    pib_amount.value = int.parse(data.pib_amount.toString());
    total_economy_amount.value =
        int.parse(data.total_economy_amount.toString());
  }

  void changeSexe(int isNewMale) async {
    isMale.value = isNewMale;
  }

  Future<void> createNewGame() async {
    final currentCountry = countries[selectedCountryIndex.value];
    await fetchAndRegroupDebateResponses();
    await fetchCandidates(currentCountry.id);

    DateTime birthDate = DateTime.parse(dateN.text);
    DateTime currentDate = DateTime.now();
    int agee = currentDate.year - birthDate.year;

    final person = PersonModel(
        country_id: countries[0].id,
        political_party_id:
            CreateNewGameController.to.selectedParti['person'] != null
                ? CreateNewGameController.to.selectedParti['person'].id
                : null,
        age: agee,
        first_name: prenom.text,
        last_name: name.text,
        birth_date: dateN.text,
        political_direction: calculateMoy(),
        image_path: imageUrl.value,
        like_me_percent: 0);
    for (int i = 0; i < 10; i++) {
      DateTime endDate =
          DateTime.now().add(Duration(days: selectedpromises[i].duration_days));
      PresidentPromisesModel promiseModel = PresidentPromisesModel(
          id: i + 1,
          promise_id: selectedpromises[i].id,
          country_id: countries[0].id,
          duration_days: selectedpromises[i].duration_days,
          end_date: dateformat.format(endDate),
          progress: 80,
          initial_value: 0,
          country_data_name: countries[0].name,
          value_to_accomplished: 0,
          is_accomplished: 0);
      presidentPromises.add(promiseModel);
    }

    final currentGame = await _gameRepo.createNewGame(
        isMale: isMale.value,
        person: person,
        countryId: currentCountry,
        concurrent: randomCandidatePerson,
        promiseModels: presidentPromises);
    loadSaveGame(currentGame);
    savedGames.value = await _gameRepo.loadSavedGames();
  }

  void reset() {
    currentLanguage.value = LanguageModel(
      imagePath: 'assets/france.svg',
      title: 'Français',
      languageCode: 'fr',
    );
    selectedContinent.value = 'Europe';
    isMale.value = 0;
    presidentPromises.clear();
    debateResponsesMap.clear();
    selectedpromises.clear();
    partyPersonList.clear();
    candidatePersonList.clear();
    selectedparties.clear();
    name.clear();
    prenom.clear();
    dateN.clear();
  }
}
