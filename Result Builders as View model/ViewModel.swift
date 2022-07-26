//
//  SettingsViewModel.swift
//  Result Builders as View model
//
//  Created by Vicente Canas on 26/07/2022.
//

import Foundation

class ViewModel {
    
    var items: [any Setting] {
        makeSettings {
            GroupSettings {
                ButtonSetting(height: 40, title: "mkay", action: {  })
            }
            GroupSettings(height: 100, backgroundColor: .red, title: "Group one") {
                ButtonSetting(height: 100, backgroundColor: .black, title: "Button", action: {  })
                ButtonSetting(height: 20, backgroundColor: .black, title: "Button", action: {  })
            }
            ImageSetting(height: 100, backgroundColor: .clear, imageName: "Image")
            GroupSettings(height: 100, backgroundColor: .clear, title: "Group two") {
                ButtonSetting(title: "Privacy Policy", action: {  })
                ButtonSetting(height: 100, title: "Terms and Conditions", action: {  })
                ButtonSetting(title: "Account", action: {  })
                ButtonSetting(title: "Fake Lobster", action: {  })
                ButtonSetting(height: 40, title: "Button", action: {  })
            }
        }
    }
    
    func makeSettings(@SettingsBuilder _ content: () -> [any Setting]) -> [any Setting] {
        content()
    }
}
