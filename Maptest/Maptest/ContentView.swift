//
//  ContentView.swift
//  Maptest
//
//  Created by Jakub Żurek on 16/12/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        MapView(viewModel: DependencyContainer.shared.makeMapViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
