// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:texon/controller/friend_controller.dart';
import 'package:texon/model/street_model.dart';
import 'package:texon/view/people_list.dart';

class Home extends StatelessWidget {
  FriendController friendController = Get.put(FriendController());

  Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Ten people'),
        ),
        body: Obx(
          () => friendController.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: friendController.friend?.info?.results,
                  itemBuilder: (context, index) {
                    final String? firstName = friendController
                        .friend?.results![index].name!.first!
                        .toString();
                    final String? lastName = friendController
                        .friend?.results![index].name!.last!
                        .toString();
                    return InkWell(
                      onTap: () {
                        Get.to(
                          PeopleList(
                            street: StreetTest(
                                friendController.friend!.results![index]
                                    .location!.street!.name
                                    .toString(),
                                friendController.friend!.results![index]
                                    .location!.street!.number
                                    .toString()),
                            address: friendController
                                .friend!.results![index].location!.city
                                .toString(),
                            city: friendController
                                .friend!.results![index].location!.city
                                .toString(),
                            email: friendController
                                .friend!.results![index].email
                                .toString(),
                            phone: friendController.friend!.results![index].cell
                                .toString(),
                            image: friendController
                                .friend!.results![index].picture!.large
                                .toString(),
                            country: friendController
                                .friend!.results![index].location!.country
                                .toString(),
                            state: friendController
                                .friend!.results![index].location!.state
                                .toString(),
                          ),
                        );
                      },
                      child: ListTile(
                        subtitle: Text(friendController
                            .friend!.results![index].location!.country
                            .toString()),
                        leading: Image.network(friendController
                            .friend!.results![index].picture!.thumbnail
                            .toString()),
                        title: Text('${firstName!} ${lastName!}'),
                      ),
                    );
                  },
                ),
        ));
  }
}
