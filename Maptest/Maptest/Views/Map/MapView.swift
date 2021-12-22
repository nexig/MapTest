//
//  MapView.swift
//  Maptest
//
//  Created by Jakub Żurek on 17/12/2021.
//

import SwiftUI
import MapKit
import CoreLocation

struct MapView: View {
    
    @StateObject var viewModel: MapViewModel
    @State var tracking : MapUserTrackingMode = .follow
    @State var manager = CLLocationManager()
    
    var body: some View {
        NavigationView {
            Map(
                coordinateRegion: $viewModel.region,
                interactionModes: .all,
                showsUserLocation: true,
                userTrackingMode: $tracking,
                annotationItems: viewModel.pins
            ) { pin in
                MapAnnotation(coordinate: pin.location.coordinate) {
                    NavigationLink {
                        StoreDetailsView(viewModel: DependencyContainer.shared.makeStoreDetailsViewModel(store: pin.store))
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 26, height: 26)
                    }
                }
            }
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                manager.delegate = viewModel
            }
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: MapViewModel(mapService: MapService()!))
    }
}
