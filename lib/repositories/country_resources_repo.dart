import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/database_helper.dart';

class CountryRessourcesRepo {
  Future<bool> updateRessource(int resId, int number, String size) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      await db.rawUpdate(
        "UPDATE country_resources SET company_size = ?, number_of_companies = ? WHERE id = ? ",
        [size, number, resId], // Corrected the order of parameters
      );

      // If the update is successful, return true
      return true;
    } catch (e) {
      print('Error occurred while updating data: $e');
      // If there's an error during the update, return false
      return false;
    }
  }



  Future<List<Map<String, dynamic>>> getRessorces(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery(
          "SELECT country_resources.*, "
          "resource_types.name as type_name "
          "FROM country_resources "
          "JOIN resource_types ON country_resources.resources_type_id = resource_types.id "
          "WHERE country_resources.country_id = ?",
          [id]);

      return list;
    } catch (e) {
      print('Error occurred while fetching organization data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<Map<String, dynamic>>> getRessorcesContracts(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery(
          "SELECT resource_contracts.*, "
          "resource_types.name as type_name, "
          "country_resources.name as resource_name, country_resources.value, country_resources.mondial_value, "
          "countries.name as country_name, countries.flag_img_path "
          "FROM resource_contracts "
          "JOIN resource_types ON resource_contracts.resource_type_id = resource_types.id "
          "JOIN country_resources ON resource_contracts.resource_id = country_resources.id "
          "JOIN countries ON resource_contracts.seller_country_id = countries.id "
          "WHERE resource_contracts.buyer_country_id = ?",
          [id]);
      return list;
    } catch (e) {
      print('Error occurred while fetching contracts data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<Map<String, dynamic>>> contractsVendre(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery(
          "SELECT resource_contracts.*, "
          "resource_types.name as type_name, "
          "country_resources.name as resource_name, country_resources.value, country_resources.mondial_value, "
          "countries.name as country_name, countries.flag_img_path "
          "FROM resource_contracts "
          "JOIN resource_types ON resource_contracts.resource_type_id = resource_types.id "
          "JOIN country_resources ON resource_contracts.resource_id = country_resources.id "
          "JOIN countries ON resource_contracts.buyer_country_id = countries.id "
          "WHERE resource_contracts.seller_country_id = ?",
          [id]);
      return list;
    } catch (e) {
      print('Error occurred while fetching contracts data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<Map<String, dynamic>>> vendre(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery(
          "SELECT resource_contracts.*, "
          "country_resources.name as resource_name, country_resources.value, country_resources.mondial_value, "
          "countries.name as country_name, countries.flag_img_path "
          "FROM resource_contracts "
          "JOIN country_resources ON resource_contracts.resource_id = country_resources.id "
          "JOIN countries ON resource_contracts.buyer_country_id = countries.id "
          "WHERE resource_contracts.seller_country_id IS NULL AND resource_contracts.buyer_country_id IS NOT NULL AND resource_contracts.buyer_country_id IS NOT ?",
          [id]);
      return list;
    } catch (e) {
      print('Error occurred while fetching contracts data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<Map<String, dynamic>>> achat(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery(
          "SELECT resource_contracts.*, "
          "country_resources.name as resource_name, country_resources.value, country_resources.mondial_value, "
          "countries.name as country_name, countries.flag_img_path "
          "FROM resource_contracts "
          "JOIN country_resources ON resource_contracts.resource_id = country_resources.id "
          "JOIN countries ON resource_contracts.seller_country_id = countries.id "
          "WHERE resource_contracts.buyer_country_id IS NULL AND resource_contracts.seller_country_id IS NOT NULL AND resource_contracts.seller_country_id IS NOT ?",
          [id]);
      return list;
    } catch (e) {
      print('Error occurred while fetching contracts data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<Map<String, dynamic>>> getRessorcesLicences(int resId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery("SELECT resource_licences.*, "
          "countries.name as country_name, countries.flag_img_path "
          "FROM resource_licences "
          "JOIN countries ON resource_licences.country_id = countries.id "
          "WHERE resource_id = ? ",[resId]
          );
      return list;
    } catch (e) {
      print('Error occurred while fetching licences data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<void> updateCountryDataAndResourceLicence(
      int licenceId,int countryId,int resId,int price) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

   
      await db.rawUpdate(
        'UPDATE country_datas SET total_economy_amount = total_economy_amount - ? WHERE country_id = ?',
        [price, countryId],
      );
      await db.rawUpdate(
        'UPDATE country_resources SET licence_level = licence_level + 1 WHERE id = ?',
        [resId],
      );
     
    
  }

  Future<void> buyResource(
      int resourceId, int countryId, int contractId, int price) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    // quantity check
    final List<Map<String, dynamic>> quantityResult = await db.rawQuery('''
    SELECT 
      CASE 
        WHEN country_resources.total_quantity > resource_contracts.total_quantity THEN 1
        ELSE 0
      END AS is_quantity_superior
    FROM 
      country_resources
    JOIN 
      resource_contracts ON country_resources.id = resource_contracts.resource_id
    WHERE
      resource_contracts.id = ? AND resource_contracts.resource_id = ? AND country_resources.country_id = resource_contracts.seller_country_id
  ''', [contractId, resourceId]);

    if (quantityResult.isEmpty) {
      print('quantity check failed');
    }

    // price_check
    final List<Map<String, dynamic>> amountResult = await db.rawQuery('''
    SELECT 
      CASE 
        WHEN country_datas.total_economy_amount > ? THEN 1
        ELSE 0
      END AS is_amount_superior
    FROM 
      country_datas
    WHERE
      country_datas.country_id = ?
  ''', [price, countryId]);

    if (amountResult.isEmpty) {
      print('price check failed');
    }

    if (quantityResult.isNotEmpty &&
        quantityResult.first['is_quantity_superior'] == 1 &&
        amountResult.isNotEmpty &&
        amountResult.first['is_amount_superior'] == 1) {
      await db.rawUpdate('''
      UPDATE country_datas
      SET total_economy_amount = total_economy_amount - ?
      WHERE country_datas.country_id = ?
    ''', [price, countryId]);

      // Get the seller country ID
      final List<Map<String, dynamic>> sellerCountryResult =
          await db.rawQuery('''
      SELECT seller_country_id
      FROM resource_contracts
      WHERE id = ?
    ''', [contractId]);

      if (sellerCountryResult.isNotEmpty) {
        final int sellerCountryId =
            sellerCountryResult.first['seller_country_id'];

        await db.rawUpdate('''
        UPDATE country_datas
        SET total_economy_amount = total_economy_amount + ?
        WHERE country_id = ?
      ''', [price, sellerCountryId]);
      }

      await db.rawUpdate('''
      UPDATE resource_contracts
      SET buyer_country_id = ?, contract_status = 1
      WHERE id = ?
    ''', [countryId, contractId]);
    }
  }

  Future<void> sellResource(
      int resourceId, int countryId, int contractId, int price) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    // quantity check
    final List<Map<String, dynamic>> quantityResult = await db.rawQuery('''
    SELECT 
      CASE 
        WHEN country_resources.total_quantity > resource_contracts.total_quantity THEN 1
        ELSE 0
      END AS is_quantity_superior
    FROM 
      country_resources
    JOIN 
      resource_contracts ON country_resources.id = resource_contracts.resource_id
    WHERE
      resource_contracts.id = ? AND resource_contracts.resource_id = ? AND country_resources.country_id = ?
  ''', [contractId, resourceId, countryId]);

    if (quantityResult.isEmpty) {
      print('quantity check failed');
    }

    // price_check
    // Get the buyer country ID
    final List<Map<String, dynamic>> buyerCountryResult = await db.rawQuery('''
      SELECT buyer_country_id
      FROM resource_contracts
      WHERE id = ?
    ''', [contractId]);
    int buyerCountryId = 0;
    if (buyerCountryResult.isNotEmpty) {
      buyerCountryId = buyerCountryResult.first['buyer_country_id'];
    }
    final List<Map<String, dynamic>> amountResult = await db.rawQuery('''
    SELECT 
      CASE 
        WHEN country_datas.total_economy_amount > ? THEN 1
        ELSE 0
      END AS is_amount_superior
    FROM 
      country_datas
    WHERE
      country_datas.country_id = ?
  ''', [price, buyerCountryId]);
    if (amountResult.isEmpty) {
      print('price check failed');
    }

    if (quantityResult.isNotEmpty &&
        quantityResult.first['is_quantity_superior'] == 1 &&
        amountResult.isNotEmpty &&
        amountResult.first['is_amount_superior'] == 1) {
      await db.rawUpdate('''
      UPDATE country_datas
      SET total_economy_amount = total_economy_amount - ?
      WHERE country_datas.country_id = ?
    ''', [price, countryId]);

      await db.rawUpdate('''
        UPDATE country_datas
        SET total_economy_amount = total_economy_amount + ?
        WHERE country_id = ?
      ''', [price, buyerCountryId]);

      await db.rawUpdate('''
      UPDATE resource_contracts
      SET seller_country_id = ?, contract_status = 1
      WHERE id = ?
    ''', [countryId, contractId]);
    }
  }
}
