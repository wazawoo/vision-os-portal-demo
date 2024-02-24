//
//  ImmersiveView.swift
//  visionOS Portal Demo
//
//  Created by Reed Moseng on 2/23/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

// Constants
extension String {
    static let imageBasedLightResourceName: Self = "ImageBasedLight"
    static let exampleSceneName: Self = "ExampleScene"
}

public func makeWorld() -> Entity {
    let world = Entity()
    world.components[WorldComponent.self] = .init()

    // Add an ImageBasedLight for the immersive content
    if let resource = try? EnvironmentResource.load(named: .imageBasedLightResourceName) {
        let iblComponent = ImageBasedLightComponent(source: .single(resource), intensityExponent: 0.25)
        world.components.set(iblComponent)
        world.components.set(ImageBasedLightReceiverComponent(imageBasedLight: world))
    }

    let exampleScene = try! Entity.load(named: .exampleSceneName, in: realityKitContentBundle)
    world.addChild(exampleScene)

    return world
}

public func makePortal(world: Entity) -> Entity {
    let portal = Entity()

    portal.components[ModelComponent.self] = .init(
        mesh: .generatePlane(
            width: 1,
            height: 1,
            cornerRadius: 0.5
        ),
        materials: [
            PortalMaterial()
        ]
    )
    portal.components[PortalComponent.self] = .init(target: world)

    return portal
}

struct ImmersiveView: View {
    var body: some View {
        RealityView { content in

            // create the world and portal entities
            let world = makeWorld()
            let portal = makePortal(world: world)

            // add both entities to this immersive space
            content.add(world)
            content.add(portal)

            // move the world 2 meters in front of us, and 0.5 meters above the ground
            world.position = SIMD3<Float>(0, 0.5, -2)

            // move the portal 2 meters in front of us, and 1 meter above the ground
            portal.position = SIMD3<Float>(0, 1, -2)
        }
    }
}
