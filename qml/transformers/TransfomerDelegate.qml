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
import "../sections"

Item {
    id: transformer
    width: parent.width
    height: row.height

    Timer {
        id: z_reseter
        onTriggered: transformer.z = 0
        interval: 400
    }
    MouseArea {
        anchors.fill: parent
        onClicked: {
            parent.z = 2 // prevent content from appearing behind
            currentItem = transformer
            parent.state == "transform" ? parent.state = "" : parent.state = "transform"
        }
    }
    Rectangle {
        id: sd
        width: parent.width
        height: parent.height

        ContentSection {
            id: contentSection
            y: 0
        }
        Row {
            id: row
            spacing: dp(16)
            topPadding: bottomPadding
            bottomPadding: dp(16)
            rightPadding: dp(16)
            leftPadding: 0
            Item {
                id: mediaContainer
                width: dp(100)
                z: 1
                height: dp(56)
                Image {
                    id: transformerMedia
                    width: parent.width
                    height: parent.height
                    fillMode: Image.PreserveAspectCrop
                    source: model.link
                }
            }
            Column {
                width: transformer.width - (mediaContainer.width + row.spacing + row.rightPadding)
                spacing: dp(0)
                TitleText {
                    id: titleText
                    text: qsTr(model.title)
                }
                DetailsText {
                    id: details
                    opacity: titleText.opacity
                    text: qsTr(model.details)
                    maximumLineCount: 2
                }
            }
        }
    }
    Divider {
        y: parent.height - height
        visible: (index != mainListView.count - 1)
        width: parent.width - x
        x: transformerMedia.width + row.spacing
    }
    onStateChanged: if (state == "")
                        z_reseter.start()
    // states
    states: [
        State {
            name: "transform"

            PropertyChanges {
                target: transformer
            }
            PropertyChanges {
                target: contentSection
                initialise: true
            }
            PropertyChanges {
                target: contentSection.flickable
                interactive: true
            }
            PropertyChanges {
                target: titleText
                opacity: 0
            }
            ParentChange {
                target: sd
                x: 0
                y: 0
                width: detailsPage.width
                height: detailsPage.height
                parent: detailsPage
            }
            ParentChange {
                target: transformerMedia
                x: 0
                y: 0
                width: contentSection.imageArea.width
                height: contentSection.imageArea.height
                parent: contentSection.imageArea
            }
            PropertyChanges {
                target: detailsPage
                opacity: 1
                y: 0
            }
            PropertyChanges {
                target: fabIcon
                text: "\uF2D5"
            }
            PropertyChanges {
                target: toolBtn
                text: "\uF156"
            }
        }
    ]

    transitions: [

        Transition {

            from: ""
            to: "transform"
            reversible: true // store prevous property states of a Component
            ParallelAnimation {
                ParentAnimation {
                    NumberAnimation {
                        id: anim1
                        duration: 400
                        properties: "x,y,width,height"
                        easing.type: Easing.InOutExpo
                    }
                }
                NumberAnimation {
                    id: anim2
                    properties: "height,width,y,opacity"
                    duration: 400
                    easing.type: Easing.InOutExpo
                }
            }
        }
    ]
}
