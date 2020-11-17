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
pragma Singleton
import QtQuick 2.0

Item {
    readonly property var mainModel: mModel1
    ListModel {

        id: mModel1
        Component.onCompleted: {
            var _details = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum. "
            append({
                       link: "../../images/a (1).jpg",
                       title: "Crunchy nuts ",
                       details: _details
                   })
            append({
                       link: "../../images/a (2).jpg",
                       title: "Grilled Eggplant",
                       details: _details
                   })
            append({
                       link: "../../images/a (3).jpg",
                       title: "Sweet coffee",
                       details: _details
                   })
            append({
                       link: "../../images/a (4).jpg",
                       title: "Tangerine Salad",
                       details: _details
                   })
            append({
                       link: "../../images/a (5).jpg",
                       title: "Great Cup Cakes",
                       details: _details
                   })
            append({
                       link: "../../images/a (6).jpg",
                       title: "Chochlate Muffins",
                       details: _details
                   })
            append({
                       link: "../../images/a (7).jpg",
                       title: "Bizzare Muffins",
                       details: _details
                   })
            append({
                       link: "../../images/a (8).jpg",
                       title: "Chilli Salsa",
                       details: _details
                   })
            append({
                       link: "../../images/a (9).jpg",
                       title: "Milk Coffee",
                       details: _details
                   })
            append({
                       link: "../../images/a (10).jpg",
                       title: "Grapes",
                       details: _details
                   })
            append({
                       link: "../../images/a (11).jpg",
                       title: "Organic Wheat",
                       details: _details
                   })
            append({
                       link: "../../images/a (12).jpg",
                       title: "Brown Bread",
                       details: _details
                   })
        }
    }
}
