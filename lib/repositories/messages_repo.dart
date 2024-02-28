import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:gamev2/utils/database_helper.dart';

class MessagesRepo {
  Future<List<Map<String, dynamic>>> getMessages(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
        "SELECT messages_sent.message_id, messages_sent.title, messages_sent.content, messages_sent.is_opened, messages_sent.date, messages_sent.response_id, "
        "persons.first_name, persons.last_name, persons.image_path, persons.like_me_percent, "
        "countries.id as country_id, countries.name AS country_name, countries.flag_img_path, countries.currency, countries.map_img_path, "
        "country_datas.total_economy_amount, country_datas.population_number, country_datas.pib_amount, "
        "country_relations.relationship_strength AS relation "
        "FROM messages_sent "
        "JOIN persons ON messages_sent.sender_person_id = persons.id "
        "JOIN countries ON messages_sent.sender_country_id = countries.id "
        "JOIN country_datas ON messages_sent.sender_country_id = country_datas.country_id "
        "JOIN country_relations ON messages_sent.sender_country_id = country_relations.country2_id AND messages_sent.recipient_country_id = country_relations.country1_id "
        "WHERE messages_sent.recipient_country_id = ? AND  (messages_sent.response_id IS NULL OR  messages_sent.response_id IS NOT NULL) "
        "ORDER BY datetime(messages_sent.date) DESC",
        [id],
      );
      return list;
    } catch (e) {
      print('Error occurred while fetching messages: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getMessagesResponses(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final list = await db.rawQuery(
        "SELECT * "
        "FROM messages_responses "
        "WHERE messages_responses.message_id = ?",
        [id],
      );
      return list;
    } catch (e) {
      print('Error occurred while fetching messages: $e');
      return [];
    }
  }

  Future<void> updateMessages(int msgId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      await db.rawUpdate(
          "UPDATE messages_sent SET is_opened = 1 where message_id = ?",
          [msgId]);
    } catch (e) {
      print('Error occurred while updating messages: $e');
    }
  }

  Future<void> updateResponse(int resId, int msgId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    final addedDate = dateformat.format(DateTime.now());

    try {
      await db.rawUpdate(
          "UPDATE messages_sent SET response_id = ?, response_date = ? where message_id = ?",
          [resId, addedDate, msgId]);
    } catch (e) {
      print('Error occurred while updating messages: $e');
    }
  }
}
