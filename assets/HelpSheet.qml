import bb.cascades 1.2

Sheet {
    id: helpSheet
    content: Page {
        titleBar: TitleBar {
            title: "Help"
            dismissAction: ActionItem {
                title: "Close"
                onTriggered: {
                    helpSheet.close()
                    if (helpSheet) helpSheet.destroy();
                }
            }
        }
    Container {
        Label  {
            text: "RocketCalc, a delta vee calculator for BlackBerry 10, was developed by Thurask."
            multiline: true
            horizontalAlignment: HorizontalAlignment.Center
            textFit.mode: LabelTextFitMode.Default
            textStyle.textAlign: TextAlign.Center
        }
        Label {
            text: "Source Code"
            horizontalAlignment: HorizontalAlignment.Center
            translationY: 210.0
        }
        Label {
            text: "https://github.com/thurask/rocketcalc"
            horizontalAlignment: HorizontalAlignment.Center
            content.flags: TextContentFlag.ActiveText
            translationX: 0.0
            translationY: 200.0
        }
    }
    }
}