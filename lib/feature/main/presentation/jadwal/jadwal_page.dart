import 'package:dokterian_test/app_injection.dart';
import 'package:dokterian_test/core/bloc/base_status.dart';
import 'package:dokterian_test/feature/main/domain/repository/home_repository.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/bloc/doctor_schedules_cubit.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/bloc/doctor_schedules_state.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/bloc/schedule_menu_cubit.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/widget/schedule_list_item.dart';
import 'package:dokterian_test/feature/main/presentation/jadwal/widget/schedule_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JadwalPage extends StatefulWidget {
  const JadwalPage._();

  @override
  State<JadwalPage> createState() => _JadwalPageState();

  static Widget createPage() => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => DoctorSchedulesCubit(injector.get<HomeRepository>()),
          ),
          BlocProvider(create: (_) => ScheduleMenuCubit()),
        ],
        child: const JadwalPage._(),
      );
}

class _JadwalPageState extends State<JadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              BlocBuilder<ScheduleMenuCubit, int>(builder: (builderCtx, index) {
                return ScheduleMenu(
                  activeIndex: index,
                  onMenuChanged: (index) {
                    builderCtx.read<ScheduleMenuCubit>().changeMenu(index);
                  },
                );
              }),
              const SizedBox(height: 24),
              Expanded(
                child: BlocBuilder<DoctorSchedulesCubit, DoctorSchedulesState>(
                  builder: (builderCtx, state) {
                    if (state.status == BaseStatus.loading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state.status == BaseStatus.success) {
                      return ListView.separated(
                        physics: const BouncingScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        itemCount: state.data.length,
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 16),
                        itemBuilder: (context, index) =>
                            ScheduleListItem(data: state.data[index]),
                      );
                    }

                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
