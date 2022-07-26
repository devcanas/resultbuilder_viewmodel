//
//  Result_Builders_as_View_modelApp.swift
//  Result Builders as View model
//
//  Created by Vicente Canas on 25/07/2022.
//

import SwiftUI

@main
struct Result_Builders_as_View_modelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: ViewModel())
        }
    }
}
