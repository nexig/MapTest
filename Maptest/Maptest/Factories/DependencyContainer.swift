//
//  DependencyContainer.swift
//  Maptest
//
//  Created by Jakub Żurek on 17/12/2021.
//

import Foundation

protocol DependencyContainerProtocol {
    
    func register<Component>(type: Component.Type, component: Any)
    func resolve<Component>(type: Component.Type) -> Component?
    
}

final class DependencyContainer: DependencyContainerProtocol {
    
    static let shared = DependencyContainer()
    
    private init() {
        register(type: MapServiceProtocol.self, component: MapService()!)
    }
    
    var components: [String: Any] = [:]
    
    func register<Component>(type: Component.Type, component: Any) {
        components["\(type)"] = component
    }
    
    func resolve<Component>(type: Component.Type) -> Component? {
        return components["\(type)"] as? Component
    }

}

extension DependencyContainer: ViewModelFactory {
    
    func makeMapViewModel() -> MapViewModel {
        return MapViewModel(mapService: DependencyContainer.shared.resolve(type: MapServiceProtocol.self)!)
    }
    
    func makeStoreDetailsViewModel(store: StoreDTO) -> StoreDetailsViewModel {
        return StoreDetailsViewModel(store: store)
    }
    
}
