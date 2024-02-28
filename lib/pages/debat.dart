// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:gamev2/controllers/create_new_game_controller.dart';
import 'package:gamev2/controllers/navigation_controller.dart';
import 'package:gamev2/models/presidential_debate_responses_model.dart';
import 'package:gamev2/pages/election.dart';
import 'package:gamev2/utils/constants.dart';
import 'package:get/get.dart';

class Debat extends StatefulWidget {
  const Debat({super.key});

  @override
  State<Debat> createState() => _DebatState();
}

class _DebatState extends State<Debat> {
  PageController _pageController = PageController();
  int _currentQuestionIndex = 0;
  int _currentResponseIndex = -1;
  bool end = false;
  List<bool> _isHoveredList = List.generate(
      CreateNewGameController.to.debateResponsesMap.keys.length,
      (index) => false);

  void _nextQuestion() {
    if (_currentQuestionIndex < 2) {
      Future.delayed(Duration.zero, () {
        setState(() {
          _currentQuestionIndex++;
          _currentResponseIndex = -1; // Resetting the response index
        });
      });
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    } else if (_currentQuestionIndex == 2) {
      Future.delayed(Duration.zero, () {
        setState(() {
          end = true;
        });
      });
      _pageController.nextPage(
        duration: Duration(milliseconds: 300),
        curve: Curves.ease,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: 15),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/debat_bg.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Text(
                'Débat présidentiel',
                style: TextStyle(
                    fontSize: 40,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Obx(
              () => Expanded(
                  flex: 10,
                  child: PageView.builder(
                      controller: _pageController,
                      itemCount: CreateNewGameController
                          .to.debateResponsesMap.keys.length,
                      onPageChanged: (index) {
                        setState(() {
                          _currentQuestionIndex = index;
                        });
                      },
                      itemBuilder: ((context, index) {
                        int debateId = CreateNewGameController
                            .to.debateResponsesMap.keys
                            .toList()[index];
                        List<PresidentialDebateResponsesModel> responses =
                            CreateNewGameController
                                .to.debateResponsesMap[debateId]!;

                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Center(
                                  child: AnimatedOpacity(
                                opacity: end ? 0.0 : 1.0,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.ease,
                                child: Container(
                                  height: 80,
                                  width: 874,
                                  decoration: BoxDecoration(
                                    color: Color(0xff5D7AAE),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10.0),
                                      topRight: Radius.circular(10.0),
                                      bottomLeft: Radius.circular(10.0),
                                      bottomRight: Radius.circular(0.0),
                                    ),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 5, horizontal: 10),
                                  child: Column(
                                    children: [
                                      Text(
                                        CreateNewGameController.to.debates
                                            .firstWhere((debate) =>
                                                debate.id == debateId)
                                            .content,
                                        style: kP5,
                                      ),
                                    ],
                                  ),
                                ),
                              )),
                            ),
                            Expanded(
                              flex: 2,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0xff0F2140),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            '${CreateNewGameController.to.prenom.value.text} ${CreateNewGameController.to.name.value.text}',
                                            style: kP6),
                                        Image.asset(
                                          CreateNewGameController
                                              .to.imageUrl.value,
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 150,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 150),
                                      child:
                                          Image.asset('assets/debat_pr.png')),
                                  Container(
                                    height: 200,
                                    decoration: BoxDecoration(
                                        color: Color(0xff0F2140),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 15),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                            '${CreateNewGameController.to.randomCandidatePerson.value['person'].first_name} ${CreateNewGameController.to.randomCandidatePerson.value['person']?.last_name}',
                                            style: kP6),
                                       Image.asset(
                                          CreateNewGameController
                                              .to
                                              .randomCandidatePerson
                                              .value['person']
                                              .image_path,
                                          fit: BoxFit.cover,
                                          width: 120,
                                          height: 150,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                                flex: 1,
                                child: AnimatedOpacity(
                                  opacity: end ? 0.0 : 1.0,
                                  duration: Duration(milliseconds: 300),
                                  curve: Curves.ease,
                                  child: Container(
                                    margin: EdgeInsets.only(left: 250),
                                    child: ListView.builder(
                                      padding: EdgeInsets.all(10),
                                      scrollDirection: Axis.horizontal,
                                      itemCount: responses.length,
                                      itemExtent: 100,
                                      itemBuilder: (context, resId) {
                                        PresidentialDebateResponsesModel
                                            response = responses[resId];
                                        return GestureDetector(
                                          onTap: () {
                                            _nextQuestion();
                                            setState(() {
                                              _currentResponseIndex = resId;
                                            });
                                          },
                                          child: MouseRegion(
                                            onEnter: (event) =>
                                                _changeHoverState(resId, true),
                                            onExit: (event) =>
                                                _changeHoverState(resId, false),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    color:
                                                        _currentResponseIndex ==
                                                                    resId ||
                                                                _isHoveredList[
                                                                        resId] ==
                                                                    true
                                                            ? Color(0xff19BE99)
                                                            : Color(0xff5D7AAE),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    response.name,
                                                    style: kP5,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )),
                          ],
                        );
                      }))),
            ),
            Expanded(
                                flex: 2,

              child: AnimatedOpacity(
                opacity: !end ? 0.0 : 1.0,
                duration: Duration(milliseconds: 300),
                curve: Curves.ease,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () async {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Election(),
                          ));
                        },
                        child: const Text('Valider'),
                      ),
                    ],
                  ),
                
              ),
            )
          ],
        ),
      ),
    );
  }

  void _changeHoverState(int index, bool isHovered) {
    setState(() {
      _isHoveredList[index] = isHovered;
    });
  }
}
