import QtQuick 2.15
import QtQuick.Window 2.15

import Components 1.0

Window {
    id: window
    width: 640
    height: 480
    visible: true
    flags: Qt.Window |
           Qt.FramelessWindowHint |
           Qt.WindowMinimizeButtonHint |
           Qt.WindowSystemMenuHint

    onVisibilityChanged: {
        if (Window.Minimized !== visibility) {
            flags = Qt.Window | Qt.FramelessWindowHint
        }
    }

    TitleBar {
        window: window
    }
}
