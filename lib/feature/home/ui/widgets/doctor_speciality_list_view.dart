import 'package:dooc_app/feature/home/ui/widgets/specialization_item.dart';
import 'package:flutter/material.dart';
import '../../data/models/specialization_response.dart';

class DoctorsSpecialityListView extends StatelessWidget {
  final List<SpecializationData> specializationDataList;
  const DoctorsSpecialityListView({super.key, required this.specializationDataList});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return SpecializationItem(
            itemIndex: index,
            specializationData:specializationDataList[index] ,
          );
        },
        itemCount: specializationDataList.length,
      ),
    );
  }
}
