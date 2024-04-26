import 'package:clean_folder_str/screens/authentication/bloc/authentication_bloc.dart';
import 'package:clean_folder_str/screens/home/widgets/personal_info_child_tile.dart';
import 'package:clean_folder_str/screens/home/widgets/personal_info_parent_tile.dart';
import 'package:clean_folder_str/screens/login/views/login_screen.dart';
import 'package:clean_folder_str/utils/helpers/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "/home-screen";
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeView();
  }
}

class HomeView extends StatelessWidget {
  HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
              builder: (context, state) {
                return Column(
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text("Logout"),
                              content: const Text(
                                "Are you sure?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("No"),
                                ),
                                BlocListener<AuthenticationBloc,
                                    AuthenticationState>(
                                  listener: (context, state) {
                                    if (state.status ==
                                        AuthenticationStatus.unauthenticated) {
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              LoginScreen.routeName,
                                              (route) => false);
                                      CustomSnackBar.success(
                                        context: context,
                                        title: "Logout",
                                        message:
                                            "You have successfully logout.",
                                      );
                                    } else {
                                      CustomSnackBar.error(
                                        context: context,
                                        title: "Logout",
                                        message: "Something went wrong",
                                      );
                                    }
                                  },
                                  child: TextButton(
                                    onPressed: () async {
                                      BlocProvider.of<AuthenticationBloc>(
                                              context)
                                          .add(AuthenticationLogoutRequested());
                                    },
                                    child: const Text("Yes"),
                                  ),
                                )
                              ],
                            );
                          },
                        );
                      },
                      child: const Text("Logout"),
                    ),
                    PersonalInfoParentTile(
                      personalInfoChildTile: [
                        PersonalInfoChildTile(
                          title: "Full Name",
                          subtitle: state.user?.fullname,
                        ),
                        PersonalInfoChildTile(
                          title: "Phone Number",
                          subtitle: state.user?.phoneNumber,
                        ),
                        PersonalInfoChildTile(
                          title: "Email",
                          subtitle: state.user?.email,
                        ),
                        PersonalInfoChildTile(
                          title: "Date of Birth",
                          subtitle: state.user?.dob,
                        ),
                        PersonalInfoChildTile(
                          title: "Gender",
                          subtitle: state.user?.gender,
                        ),
                        PersonalInfoChildTile(
                          title: "Marital Status",
                          subtitle: state.user?.maritalStatus,
                        ),
                        PersonalInfoChildTile(
                          title: "Blood Group",
                          subtitle: state.user?.bloodGroup,
                        ),
                        PersonalInfoChildTile(
                          title: "Nationality",
                          subtitle: state.user?.nationality,
                        ),
                        PersonalInfoChildTile(
                          title: "Address",
                          subtitle: state.user?.address,
                        ),
                        PersonalInfoChildTile(
                          title: "Identification No.",
                          subtitle: state.user?.identificationNo,
                        ),
                        PersonalInfoChildTile(
                          title: "Field of Study",
                          subtitle: state.user?.fieldOfStudy,
                        ),
                        PersonalInfoChildTile(
                          title: "Institute",
                          subtitle: state.user?.institute,
                        ),
                        PersonalInfoChildTile(
                          title: "Emergency contact",
                          subtitle: state.user?.emergencyContact,
                        ),
                        PersonalInfoChildTile(
                          title: "Emergency Phone",
                          subtitle: state.user?.emergencyPhone,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 200,
                    ),
                  ],
                );
              },
            ),
          )),
    );
  }
}
