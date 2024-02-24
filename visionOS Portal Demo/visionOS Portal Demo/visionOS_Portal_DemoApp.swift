//
//  visionOS_Portal_DemoApp.swift
//  visionOS Portal Demo
//
//  Created by Reed Moseng on 2/23/24.
//

import SwiftUI

@main
struct visionOS_Portal_DemoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }.windowStyle(.volumetric)

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
