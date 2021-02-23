import QtQuick 2.15
import QtQuick.Window 2.15

import Components 1.0

Window {
    id: window
    visible: true
    width: 1024
    height: 768
    flags: Qt.Window | Qt.FramelessWindowHint | Qt.WindowMinimizeButtonHint
           | Qt.WindowSystemMenuHint
    color: '#323232'

    onVisibilityChanged: {
        if (Window.Minimized !== visibility) {
            flags = Qt.Window | Qt.FramelessWindowHint
        }
    }

    TitleBar {
        window: window
    }

    Component.onCompleted: {
        showMaximized()
    }
}
