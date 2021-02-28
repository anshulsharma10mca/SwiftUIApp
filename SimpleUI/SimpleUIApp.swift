//
//  SimpleUIApp.swift
//  SimpleUI
//
//  Created by Anshul Sharma on 2/27/21.
//

import SwiftUI

@main
struct SimpleUIApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: makeViewModel())
        }
    }
}

extension SimpleUIApp {
    
    func makeViewModel() -> ContentView.ViewModel {
        let searchViewModel: SearchBar.ViewModel = .init(searchText: "")
        let viewModel:ContentView.ViewModel = .init(searchViewModel: searchViewModel, store: ["Anshul", "Ayush", "Adwika", "Anaya", "Belu", "Bajrangi", "Dolly", "Purab"])
        
        let publisher = searchViewModel.$searchText
        let subscription = publisher.sink { (text) in
            viewModel.filteredValues = viewModel.store.filter({ text.isEmpty ? true : $0.lowercased().range(of: text.lowercased()) != nil })
        }
        viewModel.subscription = subscription
        return viewModel
    }
}
