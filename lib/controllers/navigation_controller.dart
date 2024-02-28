import 'package:flutter/material.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/country_datas_model.dart';
import 'package:gamev2/models/country_debts_model.dart';
import 'package:gamev2/models/country_effects_init_model.dart';
import 'package:gamev2/models/country_effects_model.dart';
import 'package:gamev2/models/country_laws_model.dart';
import 'package:gamev2/models/country_model.dart';
import 'package:gamev2/models/current_game_model.dart';
import 'package:gamev2/models/election_model.dart';
import 'package:gamev2/models/country_ministers_model.dart';
import 'package:gamev2/models/organization_members_model.dart';
import 'package:gamev2/models/organization_prerequisites_model.dart';
import 'package:gamev2/models/person_model.dart';
import 'package:gamev2/models/political_parties_model.dart';
import 'package:gamev2/models/president_promises_model.dart';
import 'package:gamev2/models/presidential_advisor_current_demand_model.dart';
import 'package:gamev2/models/presidential_advisor_demands_model.dart';
import 'package:gamev2/models/promise_model.dart';
import 'package:gamev2/models/social_media_news_model.dart';
import 'package:gamev2/models/social_media_news_sent_model.dart';
import 'package:gamev2/repositories/countries_repo.dart';
import 'package:gamev2/repositories/country_datas_repo.dart';
import 'package:gamev2/repositories/country_debts_repo.dart';
import 'package:gamev2/repositories/country_effects.dart';
import 'package:gamev2/repositories/country_laws.dart';
import 'package:gamev2/repositories/country_population_repo.dart';
import 'package:gamev2/repositories/country_resources_repo.dart';
import 'package:gamev2/repositories/elections_repo.dart';
import 'package:gamev2/repositories/ministers_repo.dart';
import 'package:gamev2/repositories/organizations_repo.dart';
import 'package:gamev2/repositories/political_parties_repo.dart';
import 'package:gamev2/repositories/president_promises_repo.dart';
import 'package:gamev2/repositories/presidential_advisor_demands_repo.dart';
import 'package:gamev2/repositories/repos.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  static DashboardController get to => Get.find();
  final _countryDatasRepo = Repos.countryDatasRepo;
  final _countryMinistersRepo = Repos.countryminstersRepo;
  final _currentGameRepo = Repos.currentGameRepo;
  final _countriesRepo = Repos.countriesRepo;
  final _countriesevents = Repos.eventsRepo;
  final _countriesmessages = Repos.messagesRepo;
  final _electionRepo = ElectionsRepo();
  final _demandsRepo = PresidentialAdvisorDemandsRepo();
  final _presPromisesRepo = PresidentPromisesRepo();

  final selectedIndex = 0.obs;
  final population = 0.obs;
  final populationMouv = 0.obs;
  final pollution = 0.obs;
  final pollutionMouv = 0.obs;
  final security = 0.obs;
  final securityMouv = 0.obs;
  final education = 0.obs;
  final educationMouv = 0.obs;
  final health = 0.obs;
  final healthMouv = 0.obs;
  final economy = 0.obs;
  final economyMouv = 0.obs;
  final depence = 0.obs;
  final benefice = 0.obs;
  final intStab = 0.obs;
  final intStabMouv = 0.obs;
  final extStab = 0.obs;
  final extStabMouv = 0.obs;
  final justice = 0.obs;
  final justiceMouv = 0.obs;
  final military_num = 0.obs;
  final pib = 0.obs;
  final median = 0.obs;
  final debt_amount = TextEditingController();
  final debt_duration = TextEditingController();
  final ideology = 0.obs;

  final currentGame = CurrentGameModel(
          country_flag_img_path: 'assets/france.svg',
          president_image_path: 'assets/presidents/1.png',
          country_name: '',
          country_id: 1,
          points: 0,
          current_date: '',
          birth_date: '',
          my_name: '',
          first_name: '',
          last_name: '',
          gender: 0,
          start_date: '',
          end_mandat: '')
      .obs;
  RxList<CountryDatasModel> countryDatas = <CountryDatasModel>[].obs;
  RxList<CountryMinisterModel> countryMinisters = <CountryMinisterModel>[].obs;
  RxList<OrganizationMembersModel> memStatus = <OrganizationMembersModel>[].obs;
  RxList<Map<String, dynamic>> parlLaws = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ressources = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ressourcesNat = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ressourcesAgr = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> ressourcesInd = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> contractsAchat = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> contractsNat = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> contractsAgr = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> contractsInd = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> achat = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> vendre = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> contractsVendre = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> licences = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> europe = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> america = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> australia = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> asia = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> africa = <Map<String, dynamic>>[].obs;
  RxList<CountryModel> allcountries = <CountryModel>[].obs;
  RxList<Map<String, dynamic>> organizations = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> orgmembers = <Map<String, dynamic>>[].obs;
  RxList<CountryDebtsModel> debts = <CountryDebtsModel>[].obs;
  RxList<OrganizationPrerequisitesModel> prerequis =
      <OrganizationPrerequisitesModel>[].obs;
  RxList<Map<String, dynamic>> prespromisesList = <Map<String, dynamic>>[].obs;

  RxList<Map<String, dynamic>> messages = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> messagesRes = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> messagesResEffects =
      <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> demandsEffects = <Map<String, dynamic>>[].obs;
  RxList<ElectionModel> election = <ElectionModel>[].obs;
  RxList<Map<String, dynamic>> events = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> newsData = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> demandsList = <Map<String, dynamic>>[].obs;
  Map<String, dynamic>? currentDemand = <String, dynamic>{};
  RxList<Map<String, dynamic>> partyPersonList = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> countryPopulation = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> countryPopulationLaws = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> countryDebts = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> countryPIB = <Map<String, dynamic>>[].obs;
  RxMap<String, dynamic> countryInfo = <String, dynamic>{
    'id': 1,
    'country_id': 1,
    'symbol_img_path': 'assets/f1.svg',
    'continent_img_path': 'assets/f2.svg',
    'map_img_path': 'assets/f2.svg',
    'reputation': 0,
    'ambition': 0,
    'languages': '',
    'national_anthem_name': '',
    'governement_type': '',
    'area': 0,
    'capital': '',
    'currency': '',
    'name': '',
    'culinary_specialities': '',
    'army_size': 0,
    'life_expectancy': 0,
    'pib_amount': 0,
    'population_number': 0,
  }.obs;
  Future<List<CountryLawsModel>> getLaws(int id) async {
    final countrylaws = await CountryLawsRepo().getCountryLaws(id);
    return countrylaws;
  }

  Future<void> fetchPopulation(int id) async {
    countryPopulation.value = await CountryPopulationRepo().getDemograph(id);
    countryPopulationLaws.value = await CountryPopulationRepo().getDemographLaws(id);
  }

  Future<void> fetchCountryInfo(int id) async {
    final info = await CountriesRepo().getCountriesInfo(id);
    if (info != null) {
      countryInfo.value = RxMap<String, dynamic>.from(info);
    }
  }

  Future<void> fetchCountryDebts() async {
    countryDebts.value = await CountryDatasRepo().getCountryDebts();
  }

  Future<void> fetchCountryPIB() async {
    countryPIB.value = await CountryDatasRepo().getCountryPIB();
  }

  Future<void> fetchParlments() async {
    parlLaws.value = await CountryLawsRepo().getParlmentLaws();
  }

  Future<void> fetchDebts() async {
    debts.value =
        await CountryDebtsRepo().getDebts(currentGame.value.country_id);
  }

  Future<List<OrganizationPrerequisitesModel>> fetchPrerequis(int id) async {
    final result = await OrganizationsRepo().getOrganizationPrerequis(id);
    prerequis.value = result;
    return result;
  }

  Future<void> fetchOrgMembers(int id) async {
    orgmembers.value = await OrganizationsRepo().getOrganizationMembers(id);
  }

  Future<void> fetchMemberStatus(int countryId) async {
    memStatus.value = await OrganizationsRepo().getMembersStatus(countryId);
  }

  Future<void> fetchRessorces(int id) async {
    final result = await CountryRessourcesRepo().getRessorces(id);
    ressources.value = result;
    ressourcesAgr.clear();
    ressourcesNat.clear();
    ressourcesInd.clear();
    if (ressources.isNotEmpty) {
      for (int i = 0; i < ressources.length; i++) {
        if (ressources[i]['type_name'] == "Agricole") {
          ressourcesAgr.add(ressources[i]);
        } else if (ressources[i]['type_name'] == "Naturelle") {
          ressourcesNat.add(ressources[i]);
        } else if (ressources[i]['type_name'] == "Industrie") {
          ressourcesInd.add(ressources[i]);
        }
      }
    }
  }

  Future<void> fetchContracts(int id) async {
    contractsAchat.value =
        await CountryRessourcesRepo().getRessorcesContracts(id);
    contractsVendre.value = await CountryRessourcesRepo().contractsVendre(id);
    vendre.value = await CountryRessourcesRepo().vendre(id);
    achat.value = await CountryRessourcesRepo().achat(id);
    contractsNat.clear();
    contractsAgr.clear();
    contractsInd.clear();
    if (contractsAchat.isNotEmpty) {
      for (int i = 0; i < contractsAchat.length; i++) {
        if (contractsAchat[i]['type_name'] == "Agricole") {
          contractsAgr.add(contractsAchat[i]);
        } else if (contractsAchat[i]['type_name'] == "Naturelle") {
          contractsNat.add(contractsAchat[i]);
        } else if (contractsAchat[i]['type_name'] == "Industrie") {
          contractsInd.add(contractsAchat[i]);
        }
      }
    }
    if (contractsVendre.isNotEmpty) {
      for (int i = 0; i < contractsVendre.length; i++) {
        if (contractsVendre[i]['type_name'] == "Agricole") {
          contractsAgr.add(contractsVendre[i]);
        } else if (contractsVendre[i]['type_name'] == "Naturelle") {
          contractsNat.add(contractsVendre[i]);
        } else if (contractsVendre[i]['type_name'] == "Industrie") {
          contractsInd.add(contractsVendre[i]);
        }
      }
    }
  }

  Future<void> fetchLicences(int resId) async {
    licences.value = await CountryRessourcesRepo().getRessorcesLicences(resId);
  }

  Future<void> fetchOrganizations() async {
    organizations.value = await OrganizationsRepo().getOrganization();
  }

  Future<void> fetchDiplomaties(int id) async {
    europe.value = await _countriesRepo.getCountries('Europe', id);
    america.value = await _countriesRepo.getCountries('America', id);
    australia.value = await _countriesRepo.getCountries('Australia', id);
    asia.value = await _countriesRepo.getCountries('Asia', id);
    africa.value = await _countriesRepo.getCountries('Africa', id);
  }

  Future<void> fetchMessages(int id) async {
    messages.value = await _countriesmessages.getMessages(id);
  }

  Future<void> fetchMessagesResponses(int id) async {
    messagesRes.value = await _countriesmessages.getMessagesResponses(id);
  }

  Future<void> fetchMessagesResponsesEffects(int id) async {
    messagesResEffects.value =
        await CountryEffectsRepo().getMessagesResponsesEffects(id);
  }

  Future<void> fetchGame() async {
    currentGame.value = await _currentGameRepo.getCurrentGame();
  }

  Future<void> fetchCountryDatas(int id) async {
    countryDatas.value = await _countryDatasRepo.getCountryDatas(id);
    if (countryDatas.isNotEmpty) {
      for (int i = 0; i < countryDatas.length; i++) {
        population.value =
            int.parse(countryDatas[i].population_number!.toString());
        populationMouv.value =
            int.parse(countryDatas[i].population_number_per_round!.toString());
        pollution.value = int.parse(countryDatas[i].pollution_taux!.toString());
        pollutionMouv.value =
            int.parse(countryDatas[i].pollution_taux_per_round!.toString());
        security.value = int.parse(countryDatas[i].security_taux!.toString());
        securityMouv.value =
            int.parse(countryDatas[i].security_taux_per_round!.toString());
        education.value = int.parse(countryDatas[i].education_taux!.toString());
        educationMouv.value =
            int.parse(countryDatas[i].education_taux_per_round!.toString());
        health.value = int.parse(countryDatas[i].healthy_taux!.toString());
        healthMouv.value =
            int.parse(countryDatas[i].healthy_taux_per_round!.toString());
        economy.value =
            int.parse(countryDatas[i].total_economy_amount!.toString());
        economyMouv.value = int.parse(
            countryDatas[i].total_economy_amount_per_round!.toString());
        depence.value = economyMouv.value * 365;
        benefice.value = economy.value - depence.value;
        intStab.value =
            int.parse(countryDatas[i].stability_int_taux!.toString());
        intStabMouv.value =
            int.parse(countryDatas[i].stability_int_taux_per_round!.toString());
        extStab.value =
            int.parse(countryDatas[i].stability_international_taux!.toString());
        extStabMouv.value = int.parse(
            countryDatas[i].stability_international_taux_per_round!.toString());
        justice.value = int.parse(countryDatas[i].justicy_taux!.toString());
        justiceMouv.value =
            int.parse(countryDatas[i].justicy_taux_per_round!.toString());
        military_num.value =
            int.parse(countryDatas[i].military_number!.toString());
        pib.value = int.parse(countryDatas[i].pib_amount!.toString());
        median.value = int.parse(countryDatas[i].median_salary!.toString());
      }
    }
  }

  Future<void> fetchPoliticalParties(int id) async {
    final result =
        await PoliticalPartiesRepo().getPoliticalPartiesAndPersons(id);
    partyPersonList.clear();

    for (final map in result) {
      final partyModel = PoliticalPartiesModel.fromMap(map);
      final personModel = PersonModel.fromMap(map);
      Map<String, dynamic> partyPersonData = {
        'party': partyModel,
        'person': personModel,
      };

      partyPersonList.add(partyPersonData);
    }
  }

  Future<void> fetchDemands(int id) async {
    final result3 = await _demandsRepo.getDemands(id);

    demandsList.assignAll(result3.map((map) {
      final currentdemand = PresidentialAdvisorCurrentDemandModel.fromMap(map);
      final demands = PresidentialAdvisorDemandsModel.fromMap(map);

      return {
        'curr': currentdemand,
        'all': demands,
      };
    }));
    currentDemand = demandsList.isNotEmpty
        ? demandsList.reduce((curr, next) =>
            (curr['all'].id.compareTo(next['all'].id) < 0) ? curr : next)
        : null;
  }

  Future<void> fetchDemandsEffects(int id) async {
    demandsEffects.value = await CountryEffectsRepo().getDemandsEffects(id);
  }

  Future<void> updateDemandStatus() async {
    if (currentDemand != null && currentDemand!['curr']?.is_accomplished == 0) {
      await PresidentialAdvisorDemandsRepo()
          .updateDemandStatus(currentDemand!['curr']?.id);
      await fetchDemands(currentGame.value.country_id);
      if (currentDemand != null) {
        await fetchDemandsEffects(currentDemand!['all'].id);
      }
    }
  }

  bool compareDatas() {
    if (CreateNewGameController
                .to.countries[currentGame.value.country_id].continent_name ==
            prerequis[0].continent_name &&
        population >= prerequis[0].min_population_number! &&
        median >= prerequis[0].min_median_salary! &&
        pollution <= prerequis[0].max_pollution_taux! &&
        security >= prerequis[0].min_security_taux! &&
        economy >= prerequis[0].min_total_economy_amount! &&
        military_num >= prerequis[0].min_military_number! &&
        pib >= prerequis[0].min_pib_amount! &&
        intStab >= prerequis[0].min_stability_international_taux!) {
      return true;
    } else {
      return false;
    }
  }

  void init() async {
    await fetchGame();

    await fetchCountryDebts();
    await fetchCountryPIB();

    await fetchPopulation(currentGame.value.country_id);
    await fetchCountryInfo(currentGame.value.country_id);

    //get diplomaties & countries & strength
    await fetchDiplomaties(currentGame.value.country_id);
    await fetchParlments();
    // Get current game data
    await fetchMemberStatus(currentGame.value.country_id);
    await fetchPoliticalParties(currentGame.value.country_id);
    await fetchCountryDatas(currentGame.value.country_id);
    ideology.value = int.parse(
        await _countriesRepo.getIdeology(currentGame.value.country_id));

    // get ressorces
    await fetchRessorces(currentGame.value.country_id);
    await fetchContracts(currentGame.value.country_id);
    await fetchOrganizations();

    //get all countries_currency
    allcountries.value = await CountriesRepo().getCurrency();
    //get debts
    debts.value =
        await CountryDebtsRepo().getDebts(currentGame.value.country_id);
    //get parlements laws
    parlLaws.value = await CountryLawsRepo().getParlmentLaws();
    //get Ministers
    countryMinisters.value = await _countryMinistersRepo
        .getCountryMinisters(currentGame.value.country_id);
    //get demands
    await fetchDemands(currentGame.value.country_id);
    if (currentDemand != null) {
      await fetchDemandsEffects(currentDemand?['all'].id);
    }

    //get events
    final result2 =
        await _countriesevents.getSocialMediaNews(currentGame.value.country_id);
    events.clear();
    for (final map in result2) {
      final newssentModel = SocialMediaNewsSentModel.fromMap(map);
      final newmodel = SocialMediaNewsModel.fromMap(map);
      Map<String, dynamic> newsData = {
        'newsent': newssentModel,
        'new': newmodel,
      };
      events.add(newsData);
    }
    newsData.value =
        await _countriesevents.getLatestNewsSent(currentGame.value.country_id);
    //get messages
    await fetchMessages(currentGame.value.country_id);

    //get elections
    election.value =
        await _electionRepo.getElections(currentGame.value.country_id);

    //get president promises
    final result4 = await _presPromisesRepo
        .getPresidentPromises(currentGame.value.country_id);
    prespromisesList.clear();
    for (final map in result4) {
      final prepromise = PresidentPromisesModel.fromMap(map);
      final promise = PromiseModel.fromMap(map);
      Map<String, dynamic> presidentPromise = {
        'prepromise': prepromise,
        'promise': promise,
      };
      prespromisesList.add(presidentPromise);
    }
  }

  navigate(int index) {
    selectedIndex.value = index;
  }
}
