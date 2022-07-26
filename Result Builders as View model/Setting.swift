//
//  Settings.swift
//  Result Builders as View model
//
//  Created by Vicente Canas on 26/07/2022.
//

import Foundation
import SwiftUI

protocol Setting {
    var height: CGFloat? { get }
    var backgroundColor: Color { get }
    
    @ViewBuilder func create() -> AnyView
}

struct GenericViewSetting: Setting {
    var height: CGFloat? = nil
    var backgroundColor: Color
    
    @ViewBuilder let builder: () -> any View
    
    init(
        height: CGFloat? = nil,
        backgroundColor: Color = .clear,
        @ViewBuilder builder: @escaping () -> any View
    ) {
        self.height = height
        self.backgroundColor = backgroundColor
        self.builder = builder
    }
    
    @ViewBuilder
    func create() -> AnyView {
        AnyView(builder())
    }
}

struct ImageSetting: Setting {
    var height: CGFloat? = nil
    var backgroundColor: Color
    
    let imageName: String
    
    @ViewBuilder
    func create() -> AnyView {
        AnyView(Image(imageName).resizable().scaledToFit())
    }
}

struct ButtonSetting: Setting {
    var height: CGFloat?
    var backgroundColor: Color = .white
    
    let title: String
    let action: () -> ()
    
    @ViewBuilder
    func create() -> AnyView {
        AnyView(
            ZStack {
                backgroundColor
                Button(action: action) {
                    Text(title)
                        .foregroundColor(Color(.darkGray))
                        .frame(height: height)
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .leading)
                        .padding(.leading)
                }
            }
        )
    }
}

struct GroupSettings: Setting {
    var height: CGFloat? = nil
    var backgroundColor: Color
    
    let title: String?
    let group: [any Setting]
    
    init(height: CGFloat? = nil, backgroundColor: Color = .clear, title: String? = nil, @SettingsBuilder builder: @escaping () -> [any Setting]) {
        self.height = height
        self.backgroundColor = backgroundColor
        self.title = title
        self.group = builder()
    }
    
    @ViewBuilder
    func create() -> AnyView {
        AnyView(
            ZStack {
                backgroundColor
                VStack(alignment: .leading) {
                    if let title {
                        Text(title)
                            .padding(.leading)
                    }
                    VStack(alignment: .leading, spacing: 0) {
                        ForEach(0 ..< group.count, id: \.self) { index in
                            if index == 0 && index == group.count - 1 {
                                group[index].create().cornerRadius(10, corners: .allCorners)
                            } else if index == 0 {
                                group[index].create().cornerRadius(10, corners: [.topLeft, .topRight])
                            } else if index == group.count - 1 {
                                group[index].create().cornerRadius(10, corners: [.bottomLeft, .bottomRight])
                            } else {
                                group[index].create()
                            }
                            Color(.lightGray.withAlphaComponent(0.1))
                                .frame(height: 1)
                        }
                    }
                }
            }.padding(.vertical)
        )
    }
}
