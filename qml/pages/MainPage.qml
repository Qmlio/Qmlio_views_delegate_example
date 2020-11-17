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
import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Material 2.0
import "../transformers"
import "../controls"
import "../singletons"

Page {
    id: mainPage
    property var currentItem
    anchors.fill: parent
    background: Rectangle {
    }
    header: ToolBar {
        width: parent.width
        height: dp(56)
        leftPadding: rightPadding
        rightPadding: dp(16)
        Material.accent: Material.Red
        Rectangle {
            width: parent.width + ((x * 2) * -1)
            height: parent.height
            color: appAccentColor
            x: -dp(16)
        }
        ToolButton {
            id: toolBtn
            width: height
            height: dp(32)
            anchors.verticalCenter: parent.verticalCenter
            text: "\uF35C"
            font.pixelSize: sp(24)
            onClicked: {
                if (currentItem)
                    currentItem.state = ""
            }
        }
        TitleText {
            id: toolBarTitle
            x: dp(72)
            text: "My Recipes"
            color: "#fff"
            font.letterSpacing: 0.15
            anchors.verticalCenter: parent.verticalCenter
        }
    }
    ContentPage {
        id: contentsPage
    }
    DetailsPage {
        id: detailsPage
    }

    // Fake FAB
    Rectangle {
        width: height
        height: dp(56)
        radius: width / 2
        color: appAccentColor
        x: parent.width - (width + dp(16))
        y: parent.height - (height + dp(16))
        Text {
            id:fabIcon
            anchors.centerIn: parent
            font.pixelSize: sp(28)
            color: "#fff"
            font.family: AppFonts.iconFont
            text: "\uF415"
        }
    }
}
