/****************************************************************************
**
** Copyright (C) 2017 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of the Qt Quick Controls 2 module of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:LGPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU Lesser General Public License Usage
** Alternatively, this file may be used under the terms of the GNU Lesser
** General Public License version 3 as published by the Free Software
** Foundation and appearing in the file LICENSE.LGPL3 included in the
** packaging of this file. Please review the following information to
** ensure the GNU Lesser General Public License version 3 requirements
** will be met: https://www.gnu.org/licenses/lgpl-3.0.html.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 2.0 or (at your option) the GNU General
** Public license version 3 or any later version approved by the KDE Free
** Qt Foundation. The licenses are as published by the Free Software
** Foundation and appearing in the file LICENSE.GPL2 and LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-2.0.html and
** https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick
import QtQuick.Templates as T
import QtQuick.Controls.Imagine
import QtQuick.Controls.Imagine.impl

T.Slider {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitHandleWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitHandleHeight + topPadding + bottomPadding)

    topPadding: background ? background.topPadding : 0
    leftPadding: background ? background.leftPadding : 0
    rightPadding: background ? background.rightPadding : 0
    bottomPadding: background ? background.bottomPadding : 0

    topInset: background ? -background.topInset || 0 : 0
    leftInset: background ? -background.leftInset || 0 : 0
    rightInset: background ? -background.rightInset || 0 : 0
    bottomInset: background ? -background.bottomInset || 0 : 0

    handle: Image {
        x: Math.round(control.leftPadding + (control.horizontal ? control.visualPosition * (control.availableWidth - width) : (control.availableWidth - width) / 2))
        y: Math.round(control.topPadding + (control.horizontal ? (control.availableHeight - height) / 2 : control.visualPosition * (control.availableHeight - height)))

        source: control.Imagine.url + "slider-handle"
        ImageSelector on source {
            states: [
                {"vertical": control.vertical},
                {"horizontal": control.horizontal},
                {"disabled": !control.enabled},
                {"pressed": control.pressed},
                {"focused": control.visualFocus},
                {"mirrored": control.mirrored},
                {"hovered": control.enabled && control.hovered}
            ]
        }
    }

    background: NinePatchImage {
        scale: control.horizontal && control.mirrored ? -1 : 1

        source: control.Imagine.url + "slider-background"
        NinePatchImageSelector on source {
            states: [
                {"vertical": control.vertical},
                {"horizontal": control.horizontal},
                {"disabled": !control.enabled},
                {"pressed": control.down},
                {"focused": control.visualFocus},
                {"mirrored": control.mirrored},
                {"hovered": control.enabled && control.hovered}
            ]
        }

        NinePatchImage {
            x: control.horizontal ? 0 : (parent.width - width) / 2
            y: control.horizontal
               ? (parent.height - height) / 2
               : control.handle.height / 2 + control.visualPosition * (parent.height - control.handle.height)
            width: control.horizontal
                ? control.handle.width / 2 + control.position * (parent.width - control.handle.width)
                : parent.width
            height: control.vertical
                ? control.handle.height / 2 + control.position * (parent.height - control.handle.height)
                : parent.height

            source: control.Imagine.url + "slider-progress"
            NinePatchImageSelector on source {
                states: [
                    {"vertical": control.vertical},
                    {"horizontal": control.horizontal},
                    {"disabled": !control.enabled},
                    {"pressed": control.down},
                    {"focused": control.visualFocus},
                    {"mirrored": control.mirrored},
                    {"hovered": control.enabled && control.hovered}
                ]
            }
        }
    }
}
