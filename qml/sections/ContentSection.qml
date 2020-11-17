/* Copyright (c) 2020 Qmlio
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
*/
import QtQuick 2.11
import QtQuick.Controls 2.4
import "../singletons"
import "../controls"

Rectangle {
    property alias imageArea: mImageArea
    property alias flickable: mFlickable
    property bool initialise: false
    onInitialiseChanged: {

        // quickly hide content
        if (!initialise) {
            mtitle.opacity = 0
            mdetails.opacity = 0
        }
        pause_timer.start()
    }
    Timer {
        id: pause_timer
        interval: 250
        onTriggered: {
            init(initialise)
        }
    }

    id: contentSection
    z: 1
    width: parent.width
    height: parent.height
    color: "transparent"
    Flickable {
        id: mFlickable
        anchors.fill: parent
        interactive: false
        contentHeight: mainColumn.height
        Column {
            id: mainColumn
            width: parent.width
            spacing: dp(8)
            leftPadding: rightPadding
            rightPadding: dp(16)
            Rectangle {
                id: mImageArea
                z: 1
                x: -dp(16)
                width: parent.width + mainColumn.leftPadding * 2
                height: contentSection.height / 3
                color: "transparent"
            }
            Item {
                width: parent.width - dp(32)
                height: mtitle.implicitHeight
                TitleText {
                    id: mtitle
                    text: model.title
                    opacity: 0
                    font.pixelSize: sp(28)
                    font.letterSpacing: 0
                    y: dp(30)
                }
            }
            Item {
                width: parent.width - dp(32)
                height: mdetails.implicitHeight
                DetailsText {
                    id: mdetails
                    opacity: 0
                    y: dp(50)
                    text: qsTr(model.details)
                }
            }
        }
    }
    states: [
        State {
            name: "push"
            PropertyChanges {
                target: mtitle
                opacity: 1
                y: 0
            }
            PropertyChanges {
                target: mdetails
                opacity: 1
                y: 0
            }
        }
    ]
    transitions: [
        Transition {
            from: ""
            to: "push"
            reversible: true
            NumberAnimation {
                duration: 350
                easing.type: Easing.OutExpo
                properties: "opacity,y"
            }
        }
    ]
    function init(yes) {
        if (yes)
            contentSection.state = "push"
        else {

            contentSection.state = ""
        }
    }
}
