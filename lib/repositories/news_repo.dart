import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/models/news_model.dart';
import 'package:gamev2/utils/database_helper.dart';

class NewsRepo {
  Future<List<Map<String, dynamic>>> getSocialMediaNews(int countryId) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);
    try {
      final result = await db.rawQuery(
        "SELECT social_media_news_sent.*, social_media_news.id AS social_media_news_id, social_media_news.* "
        "FROM social_media_news_sent "
        "JOIN social_media_news ON social_media_news_sent.social_media_news_id = social_media_news.id "
        "WHERE social_media_news_sent.country_id = ?",
        [countryId],
      );

      return result;
    } catch (e) {
      print('Error occurred while fetching news: $e');
      return [];
    }
  }

  Future<List<Map<String, dynamic>>> getLatestNewsSent(int id) async {
    final current = CreateNewGameController.to.currentSaveGame.value;
    final db = await DatabaseHelper.instance.currentDatabase(current);

    try {
      final List<Map<String, dynamic>> result = await db.rawQuery('''
      SELECT news.*, persons.first_name AS author_first_name, persons.last_name AS author_last_name
      FROM news_sent
      JOIN news ON news.id = news_sent.news_id
      JOIN persons ON news_sent.author_id = persons.id
      WHERE news_sent.country_id = ?
      ORDER BY datetime(news_sent.sent_date) DESC
      LIMIT 1
      ''', [id]);

      return result;
    } catch (e) {
      print('Error occurred while fetching latest news sent: $e');
      return [];
    }
  }
}
