import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/organization_members_model.dart';

import 'package:gamev2/models/organization_prerequisites_model.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';

class OrganizationsRepo {
  Future<List<Map<String, dynamic>>> getOrganization() async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery("SELECT organizations.*, "
          "persons.first_name, persons.last_name, persons.image_path AS person_image_path, persons.like_me_percent, "
          "countries.id AS country_id, countries.name AS country_name, countries.flag_img_path "
          "FROM organizations "
          "JOIN persons ON organizations.director_id = persons.id "
          "JOIN countries ON persons.country_id = countries.id");

      return list;
    } catch (e) {
      print('Error occurred while fetching organization data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<Map<String, dynamic>>> getOrganizationMembers(int orgId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final list = await db.rawQuery(
          "SELECT organizations_members.*, "
          "countries.flag_img_path "
          "FROM organizations_members "
          "JOIN countries ON organizations_members.country_id = countries.id "
          "WHERE organizations_members.organization_id = ?",
          [orgId]);

      return list;
    } catch (e) {
      print('Error occurred while fetching organization data: $e');
      return <Map<String, dynamic>>[];
    }
  }

  Future<List<OrganizationPrerequisitesModel>> getOrganizationPrerequis(
      int orgId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
          "SELECT * FROM organizations_prerequisites where organization_id = ?",
          [orgId]);

      if (list.isNotEmpty) {
        return list
            .map((e) => OrganizationPrerequisitesModel.fromMap(e))
            .toList();
      } else {
        print('No records found for organization with ID: $orgId');
        return <OrganizationPrerequisitesModel>[];
      }
    } catch (e) {
      print('Error occurred while fetching organization prerequisites: $e');
      return <OrganizationPrerequisitesModel>[];
    }
  }

  Future<bool> doesRecordExist(int organizationId, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final result = await db.rawQuery('''
      SELECT *
      FROM organizations_members
      WHERE organization_id = ? AND country_id = ? AND status = 'MEMBER'
    ''', [organizationId, countryId]);

      return result.isNotEmpty;
    } catch (e) {
      print('Error occurred while checking for record existence: $e');
      rethrow;
    }
  }

  Future<void> updateMemberStatus(
      String newStatus, int organizationId, int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final date = dateformat.format(DateTime.now());
      await db.rawUpdate(
        'UPDATE organizations_members SET status = ? , enter_date = ? WHERE organization_id = ? AND country_id = ?',
        [newStatus, date, organizationId, countryId],
      );
    } catch (e) {
      print('Error occurred while updating member status: $e');
    }
  }

  Future<List<OrganizationMembersModel>> getMembersStatus(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
        'SELECT * FROM organizations_members WHERE country_id = ? ORDER BY organization_id ASC',
        [countryId],
      );
      if (list.isNotEmpty) {   

        return list.map((e) => OrganizationMembersModel.fromMap(e)).toList();
      } else {
        return <OrganizationMembersModel>[];
      }
    } catch (e) {
      print('Error occurred while retrieving members status: $e');
      return <OrganizationMembersModel>[];
    }
  }
}
