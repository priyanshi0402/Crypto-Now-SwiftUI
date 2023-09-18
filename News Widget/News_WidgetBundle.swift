//
//  News_WidgetBundle.swift
//  News Widget
//
//  Created by SARVADHI on 17/09/23.
//

import WidgetKit
import SwiftUI

@main
struct News_WidgetBundle: WidgetBundle {
    var body: some Widget {
        News_Widget()
        News_WidgetLiveActivity()
    }
}
