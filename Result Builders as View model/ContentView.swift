//
//  ContentView.swift
//  Result Builders as View model
//
//  Created by Vicente Canas on 25/07/2022.
//

import SwiftUI

struct ContentView: View {

    let viewModel: ViewModel
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack {
            Color(.lightGray.withAlphaComponent(0.3))
            ScrollView {
                ForEach(0 ..< viewModel.items.count, id: \.self) { index in
                    viewModel.items[index].create()
                }
            }.padding(.horizontal, 12)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: ViewModel())
    }
}

@resultBuilder
struct SettingsBuilder {
    static func buildBlock(_ components: any Setting...) -> [any Setting] {
        components
    }
}
