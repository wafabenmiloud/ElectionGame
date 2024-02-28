import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/news_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class CountryPopulationRepo {
  Future<List<Map<String, dynamic>>> getDemograph(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final result = await db.rawQuery(
        "SELECT * FROM country_population where country_id = ?",
        [id],
      );

      // Creating a Map to store grouped results by attribute_type_label
      final Map<String, Map<String, List<Map<String, dynamic>>>>
          groupedByTypeAndValue = {};

      // Grouping by attribute_type_label and then by attribute_value_label
      for (final record in result) {
        final attributeType = record['attribute_type_label'] as String;
        final attributeValueLabel = record['attribute_value_label'] as String;

        if (!groupedByTypeAndValue.containsKey(attributeType)) {
          groupedByTypeAndValue[attributeType] = {};
        }

        if (!groupedByTypeAndValue[attributeType]!
            .containsKey(attributeValueLabel)) {
          groupedByTypeAndValue[attributeType]![attributeValueLabel] = [];
        }

        groupedByTypeAndValue[attributeType]![attributeValueLabel]!.add({
          'percent': record['percent'] as double,
          'age_category': record['age_category'] as String,
          'gender': record['gender'] as String,
          'quantity_per_person': record['quantity_per_person'] as int?,
        });
      }

      // Creating the final list
      final List<Map<String, dynamic>> finalList = [];

      groupedByTypeAndValue.forEach((attributeType, attributeValuesMap) {
        final List<Map<String, dynamic>> attributeValuesList = [];

        attributeValuesMap.forEach((attributeValueLabel, attributesList) {
          attributeValuesList.add({
            'attribute_value_label': attributeValueLabel,
            'attributes': attributesList,
          });
        });

        finalList.add({
          'attribute_type_label': attributeType,
          'attribute_values': attributeValuesList,
        });
      });
      return finalList;
    } catch (e) {
      print('Error occurred while fetching data: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getDemographLaws(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final result = await db.rawQuery('''
      SELECT attribute_type, attribute_type_label 
      FROM country_population
      WHERE country_id = ? group by attribute_type
    ''', [id]);
      // Process each country_population record and fetch corresponding laws_info
      final List<Map<String, dynamic>> finalResult = [];
      for (var countryPopulationRecord in result) {
        final attributeType = countryPopulationRecord['attribute_type'];
        final lawsInfo = await db.rawQuery('''
        SELECT country_laws_population.relation_type, 
        country_laws.name, country_laws.description, 
        country_ministers.profits, country_ministers.expenses, country_ministers.incomes, 
        country_population.percent 
        FROM country_laws_population
        JOIN country_laws ON country_laws_population.law_id = country_laws.id
        JOIN country_ministers ON country_ministers.id = country_laws.minister_id
        JOIN country_population ON country_population.id = country_laws_population.population_id
        WHERE country_laws_population.attribute_type = ?
      ''', [attributeType]);
        // Combine country_population record with laws_info
        final Map<String, dynamic> combinedResult = {
          'country_population': countryPopulationRecord,
          'laws_info': lawsInfo,
        };

        finalResult.add(combinedResult);
      }
      return finalResult;
    } catch (e) {
      print('Error occurred while fetching data: $e');
      return [];
    }
  }
}
