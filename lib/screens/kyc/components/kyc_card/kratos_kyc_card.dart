import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kratos_flutter/screens/kyc/interfaces/kratos_frame_card_tabs.dart';

class KratosKycCard extends StatefulWidget {
  final List<IKycStep> steps;

  const KratosKycCard({
    Key key,
    @required this.steps,
  }) : super(key: key);

  @override
  _KratosKycCardState createState() => _KratosKycCardState();
}

class _KratosKycCardState extends State<KratosKycCard> {
  int activeStep = 0;
  IKycStep activeEntry;

  void initState() {
    super.initState();
    activeEntry = widget.steps.elementAt(activeStep);
  }

  selectCardState(int activeIndex, IKycStep selectedEntry) {
    setState(() {
      activeStep = activeIndex;
      activeEntry = selectedEntry;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          child: Stack(
            children: [
              Container(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(
                      width: 200,
                    ),
                    Flexible(
                      child: Container(
                        padding: EdgeInsets.only(right: 40),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Theme(
                                data: ThemeData(cardTheme: CardTheme(margin: EdgeInsets.only(top: 0))),
                                child: Card(
                                  color: Colors.white,
                                  elevation: 4,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  clipBehavior: Clip.antiAlias,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(50, 20, 10, 20),
                                    child: activeEntry.widget,
                                  ),
                                ),
                              ),
                            ),
                            _KratosKycCardActions()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 230,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: widget.steps.asMap().entries.map((element) {
                    int index = element.key;
                    IKycStep entry = element.value;
                    return StepButton(
                      index: index,
                      entry: entry,
                      activeIndex: activeStep,
                      stepSelectedFunction: selectCardState,
                    );
                  }).toList(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// Step button
class StepButton extends StatelessWidget {
  final int activeIndex;
  final int index;
  final IKycStep entry;
  final Function(int activeIndex, IKycStep selectedEntry) stepSelectedFunction;

  const StepButton({
    Key key,
    @required this.activeIndex,
    @required this.index,
    @required this.entry,
    @required this.stepSelectedFunction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: index == 0 ? 30 : 50),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          hoverColor: Colors.transparent,
          onTap: () => stepSelectedFunction(index, entry),
          child: Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      entry.title1,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: activeIndex == index ? Colors.teal[900] : Colors.white,
                        shadows: activeIndex == index ? kElevationToShadow[1] : [],
                      ),
                    ),
                    (entry.title2 != null)
                        ? Text(
                            entry.title2,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: activeIndex == index ? Colors.teal[900] : Colors.white,
                              shadows: activeIndex == index ? kElevationToShadow[1] : [],
                            ),
                          )
                        : SizedBox.shrink(),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: activeIndex == index ? Colors.teal[900] : Colors.teal[300],
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: activeIndex == index ? kElevationToShadow[3] : [],
                  ),
                  child: Container(
                    width: 24,
                    height: 24,
                    child: SvgPicture.string(entry.svg),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Actions
class _KratosKycCardActions extends StatelessWidget {
  const _KratosKycCardActions({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              backgroundColor: Colors.white,
              side: BorderSide(
                color: Colors.grey[500],
              ),
              padding: EdgeInsets.symmetric(
                horizontal: 50,
                vertical: 20,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
            ),
            child: Text(
              "BACK",
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[500],
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            child: ElevatedButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: Colors.teal[300],
                side: BorderSide(
                  color: Colors.teal[400],
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6.0),
                ),
              ),
              child: Text(
                "SAVE & NEXT",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
