import 'package:flutter/material.dart';
import 'package:nlw_flutter/modules/home/home_controller.dart';
import 'package:nlw_flutter/shared/models/boleto_model.dart';
import 'package:nlw_flutter/shared/themes/app_colors.dart';
import 'package:nlw_flutter/shared/themes/app_text_styles.dart';
import 'package:nlw_flutter/shared/widgets/boleto_tile/boleto_tile_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  final pages = [
    Container(
      color: Colors.red,
      child: BoletoTileWidget(
        data: BoletoModel(
            name: "Gabriel",
            dueDate: "22/02/22",
            value: 100,
            barcode: "1233456789"),
      ),
    ),
    Container(color: Colors.blue),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(152),
          child: Container(
            height: 152,
            color: AppColors.primary,
            child: Center(
              child: ListTile(
                title: Text.rich(TextSpan(
                    text: "Olá, ",
                    style: TextStyles.titleRegular,
                    children: [
                      TextSpan(
                          text: "Gabriel",
                          style: TextStyles.titleBoldBackground)
                    ])),
                subtitle: Text(
                  "Mantenha suas contas em dia!",
                  style: TextStyles.captionShape,
                ),
                trailing: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(5)),
                ),
              ),
            ),
          )),
      body: pages[controller.currentPage],
      bottomNavigationBar: Container(
        height: 90,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
                onPressed: () {
                  controller.setPage(0);
                  setState(() {});
                },
                icon: Icon(
                  Icons.home,
                  color: AppColors.primary,
                )),
            GestureDetector(
              onTap: () {
                // Navigator.pushNamed(context, "/barcode_scanner");
                Navigator.pushNamed(context, "/insert_boleto");
              },
              child: Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(5)),
                  child: Icon(
                    Icons.add_box_outlined,
                    color: AppColors.background,
                  )),
            ),
            IconButton(
                onPressed: () {
                  controller.setPage(1);
                  setState(() {});
                },
                icon: Icon(
                  Icons.description_outlined,
                  color: AppColors.body,
                ))
          ],
        ),
      ),
    );
  }
}
