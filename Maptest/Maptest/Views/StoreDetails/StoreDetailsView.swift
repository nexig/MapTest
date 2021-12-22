//
//  StoreDetailsView.swift
//  Maptest
//
//  Created by Jakub Żurek on 22/12/2021.
//

import SwiftUI

struct StoreDetailsView: View {
    
    @StateObject var viewModel: StoreDetailsViewModel
    
    var body: some View {
        VStack(spacing: 8) {
            if let posTypeUrl = URL(string: viewModel.store.posTypeLogo ?? "") {
                AsyncImage(url: posTypeUrl)
            }
            Text(viewModel.store.name ?? "")
            Text(viewModel.store.address ?? "")
            HStack(spacing: 8) {
                Text(viewModel.store.city ?? "")
                Text(viewModel.store.postalCode ?? "")
            }
            Spacer()
        }
    }
}

struct StoreDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailsView(viewModel: StoreDetailsViewModel(store: StoreDTO()))
    }
}
