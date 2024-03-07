import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  List<MenuRowData> firstMenuRow = [
    MenuRowData(Icons.favorite_border_rounded, 'Избранное'),
    MenuRowData(Icons.call, 'Звонки'),
    MenuRowData(Icons.computer, 'Устройства'),
    MenuRowData(Icons.folder, 'Папка с чатами'),
  ];

  List<MenuRowData> secondMenuRow = [
    MenuRowData(Icons.notifications, 'Уведомления и звуки'),
    MenuRowData(Icons.privacy_tip, 'Конфиденциальность'),
    MenuRowData(Icons.date_range, 'Данные и память'),
    MenuRowData(Icons.brush, 'Оформление'),
    MenuRowData(Icons.language, 'Язык'),
  ];
  UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const _UserInfo(),
            const SizedBox(
              height: 30,
            ),
            _MenuWidget(menuRow: firstMenuRow),
            const SizedBox(
              height: 30,
            ),
            _MenuWidget(menuRow: secondMenuRow),
          ],
        ),
      ),
    );
  }
}

class MenuRowData {
  final IconData icon;
  final String text;

  MenuRowData(this.icon, this.text);
}

class _MenuWidget extends StatelessWidget {
  final List<MenuRowData> menuRow;
  const _MenuWidget({required this.menuRow});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: Column(
        children: menuRow.map((data) => _MenuWidgetRow(data: data)).toList(),
      ),
    );
  }
}

class _MenuWidgetRow extends StatelessWidget {
  final MenuRowData data;

  const _MenuWidgetRow({
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(data.icon),
          const SizedBox(
            width: 15,
          ),
          Expanded(child: Text(data.text)),
          const Icon(Icons.chevron_right_sharp)
        ],
      ),
    );
  }
}

class _UserInfo extends StatelessWidget {
  const _UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      child: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          _AvatarWidget(),
          SizedBox(
            height: 20,
          ),
          _UserNameWidget(),
          SizedBox(
            height: 5,
          ),
          _UserPhoneWidget(),
          SizedBox(
            height: 5,
          ),
          _UserNicknameWidget(),
        ],
      ),
    );
  }
}

class _UserNicknameWidget extends StatelessWidget {
  const _UserNicknameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '@danya.b',
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 17),
    );
  }
}

class _UserPhoneWidget extends StatelessWidget {
  const _UserPhoneWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      '+7 (924) 546 61 33',
      style: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.w600, fontSize: 17),
    );
  }
}

class _UserNameWidget extends StatelessWidget {
  const _UserNameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Danil <danya.b> Butakov',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
    );
  }
}

class _AvatarWidget extends StatelessWidget {
  const _AvatarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 0)),
    );
  }
}
