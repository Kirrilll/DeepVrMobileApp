import 'package:deepvr/core/usecases/special_types/fetching_state.dart';
import 'package:deepvr/features/profile/domain/view_models/profile_model.dart';
import 'package:deepvr/features/profile/domain/view_models/statuses_model.dart';
import 'package:deepvr/features/profile/ui/templates/profile_template.dart';
import 'package:deepvr/features/profile/ui/widgets/profile_status_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../core/di/locator.dart';

class ProfileStatuses extends StatefulWidget {
  const ProfileStatuses({Key? key}) : super(key: key);

  @override
  State<ProfileStatuses> createState() => _ProfileStatusesState();
}

class _ProfileStatusesState extends State<ProfileStatuses> {

  @override
  void initState() {
    super.initState();
    locator<ProfileStatusesModel>().getStatuses();
  }

  @override
  Widget build(BuildContext context) {
    return ProfileTemplate(
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
