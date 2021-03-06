import 'package:deepvr/domain/enums/fetching_state.dart';
import 'package:deepvr/domain/view_models/profile_model.dart';
import 'package:deepvr/domain/view_models/statuses_model.dart';
import 'package:deepvr/ui/templates/base_profile_template.dart';
import 'package:deepvr/ui/widgets/profile_status_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';

class ProfileStatuses extends StatelessWidget {
  const ProfileStatuses({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProfileTemplate(
      content: MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: locator<ProfileStatusesModel>()),
          ChangeNotifierProvider.value(value: locator<ProfileModel>())
        ],
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 19),
              SizedBox(
                height: 260,
                child: Consumer2<ProfileStatusesModel, ProfileModel>(
                  builder: (_, statusesModel, mainModel, __) => statusesModel.fetchingStatus == FetchingState.loading
                      ? const Center(child: CircularProgressIndicator())
                      : ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              ProfileStatusCard.extended(
                                  title: statusesModel.statuses[index].title,
                                  imagePath: statusesModel.statuses[index].imgPath,
                                  bonuses: '${statusesModel.statuses[index].bonusPercent}% бонусами на баланс',
                                  isUsers: statusesModel.statuses[index].id == mainModel.profileStatus.id),
                          separatorBuilder: (context, index) => const SizedBox(width: 8),
                          itemCount: statusesModel.statuses.length),
                ),
              ),
              const SizedBox(height: 27),
              const Text(
                'Правила получения статуса',
                style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.41),
                textAlign: TextAlign.left,
              ),
              const SizedBox(height: 4),
              const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit lectus nunc, orci neque neque orci. Curabitur condimentum risus nam vitae venenatis. Tortor lobortis sit hac sem auctor leo, mauris. Non aliquam nisl adipiscing ac gravida felis turpis.',
                style: TextStyle(fontSize: 12, color: Color(0xFFABAFE5)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
