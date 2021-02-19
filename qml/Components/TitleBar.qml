import QtQuick 2.15

import Themes.Dark 1.0 as Theme

MouseArea {
    width: parent.width
    height: 30

    readonly property int buttonWidth: 21
    readonly property int buttonHeight: 21
    property var window: null
    property var clickPos: Qt.point(0, 0)

    Rectangle {
        anchors.fill: parent
        color: Theme.TitleBar.mainColor
    }

    function maximizeOrRestoreWindow(window) {
        var isMaximized = window.visibility !== Qt.WindowFullScreen

        if (!isMaximized) {
            window.showNormal()
        } else {
            window.showMaximized()
        }
    }

    onDoubleClicked: maximizeOrRestoreWindow(window)

    onPressed: {
        clickPos = Qt.point(mouse.x, mouse.y)
    }

    onPositionChanged: {
        var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
        window.x += delta.x
        window.y += delta.y
    }

    Rectangle {
        color: Theme.TitleBar.mainColor
        height: parent.height
        width: children.width

        anchors.right: parent.right
        anchors.rightMargin: 14

        MouseArea {
            id: close
            width: buttonWidth
            height: buttonHeight
            anchors.right: parent.right
            anchors.verticalCenter: parent.verticalCenter

            Image {
                anchors.fill: parent
                source: "qrc:/images/icon_close.png"
            }

            onClicked: Qt.quit()
        }

        MouseArea {
            id: maximize
            width: buttonWidth
            height: buttonHeight
            anchors.right: close.left
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter

            Image {
                width: 13
                height: 11
                anchors.centerIn: parent
                source: "qrc:/images/icon_maximize.png"
            }

            onClicked: maximizeOrRestoreWindow(window)
        }

        MouseArea {
            id: manimize
            width: buttonWidth
            height: buttonHeight
            anchors.right: maximize.left
            anchors.rightMargin: 5
            anchors.verticalCenter: parent.verticalCenter

            Image {
                width: 12
                height: 1
                anchors.centerIn: parent
                source: "qrc:/images/icon_minimize.png"
            }

            onClicked: {
                window.visibility = Window.Minimized
                window.flags = Qt.Window | Qt.WindowFullscreenButtonHint
                        | Qt.CustomizeWindowHint | Qt.WindowMinimizeButtonHint
            }
        }
    }
}
