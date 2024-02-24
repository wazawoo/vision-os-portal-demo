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
        // To have this immersive space as the base scene in your app:
        // UIApplicationPreferredDefaultSceneSessionRole
        // must be set to
        // UISceneSessionRoleImmersiveSpaceApplication
        ImmersiveSpace(id: .exampleSceneName) {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
