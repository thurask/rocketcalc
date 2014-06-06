/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.2

TabbedPane {
    Menu.definition: MenuDefinition {
        // Add a Help action
        helpAction: HelpActionItem {
            onTriggered: {
                var help = helpSheetDefinition.createObject()
                help.open();
            }
        }
    }
    id: tabpane
    showTabsOnActionBar: true
    sidebarState: SidebarState.VisibleCompact
    Tab {
        id: effective_tab
        description: "Exhaust Velocity"
        title: "Exhaust Velocity"
        Page {
            titleBar: TitleBar {
                id: titlebar
                title: "Tsiolkovsky Rocket Calculator"
            }
            Container {
                id: mainroot
                property double mass_initial
                property double mass_final
                property double eff_velocity
                property double mass_ratio: mass_initial / mass_final
                property double deltav
                Label {
                    id: effvel_input_label
                    text: "Effective exhaust velocity (m/s):"
                }
                TextField {
                    id: effvel
                    hintText: "Enter effective exhaust velocity"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    onTextChanging: {
                        mainroot.eff_velocity = effvel.text
                    }
                    onTextChanged: {
                        mainroot.eff_velocity = effvel.text
                    }
                }
                Label {
                    id: initmass_input_label
                    text: "Initial mass (kg, or 100):"
                }
                TextField {
                    id: initmass
                    hintText: "Enter initial mass"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    onTextChanging: {
                        mainroot.mass_initial = initmass.text
                    }
                    onTextChanged: {
                        mainroot.mass_initial = initmass.text
                    }
                }
                Label {
                    id:finalmass_input_label
                    text: "Final mass (kg, or % remaining):"
                }
                TextField {
                    id: finalmass
                    hintText: "Enter final mass"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    onTextChanging: {
                        mainroot.mass_final = finalmass.text
                    }
                    onTextChanged: {
                        mainroot.mass_final = finalmass.text
                    }
                }
                Button {
                    id:calculate
                    text: "Calculate!"
                    horizontalAlignment: HorizontalAlignment.Center
                    onClicked: {
                        mainroot.deltav = (mainroot.eff_velocity*Math.log(mainroot.mass_ratio))
                    }
                }
                Label {
                    id: output
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "Your final delta V is: " + mainroot.deltav.toFixed(3) + " m/s"
                }
            }
        }
    }
    Tab {
        id: specific_tab
        description: "Specific Impulse"
        title: "Specific Impulse"
        Page {
            titleBar: TitleBar {
                id: titlebar_spec
                title: "Tsiolkovsky Rocket Calculator"
            }
            Container {
                id: mainroot_spec
                property double mass_initial
                property double mass_final
                property double specific_impulse
                property double mass_ratio: mass_initial / mass_final
                property double gravity: 9.80665
                property double deltav
                Label {
                    id: specimp_input_label
                    text: "Specific impulse (s):"
                }
                TextField {
                    id: specimp
                    hintText: "Enter specific impulse"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    onTextChanging: {
                        mainroot_spec.specific_impulse = specimp.text
                    }
                    onTextChanged: {
                        mainroot_spec.specific_impulse = specimp.text
                    }
                }
                Label {
                    id: initmass_input_label_spec
                    text: "Initial mass (kg, or 100):"
                }
                TextField {
                    id: initmass_spec
                    hintText: "Enter initial mass"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    onTextChanging: {
                        mainroot_spec.mass_initial = initmass_spec.text
                    }
                    onTextChanged: {
                        mainroot_spec.mass_initial = initmass_spec.text
                    }
                }
                Label {
                    id:finalmass_input_label_spec
                    text: "Final mass (kg, or % remaining):"
                }
                TextField {
                    id: finalmass_spec
                    hintText: "Enter final mass"
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    onTextChanging: {
                        mainroot_spec.mass_final = finalmass_spec.text
                    }
                    onTextChanged: {
                        mainroot_spec.mass_final = finalmass_spec.text
                    }
                }
                Button {
                    id: calculate_spec
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "Calculate!"
                    onClicked: {
                        mainroot_spec.deltav = (mainroot_spec.specific_impulse*Math.log(mainroot_spec.mass_ratio)*mainroot_spec.gravity)
                    }
                }
                Label {
                    id: output_spec
                    horizontalAlignment: HorizontalAlignment.Center
                    text: "Your final delta V is: " + mainroot_spec.deltav.toFixed(3) + " m/s"
                }
            
            }
        }
    }
    attachedObjects: [
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {
            
            }
        }
    ]
}
