//
//  ContentView.swift
//  SimpleUI
//
//  Created by Anshul Sharma on 2/27/21.
//

import SwiftUI
import Combine

public struct ContentView {
    @ObservedObject
    var viewModel: ViewModel
}

extension ContentView: View {
    public var body: some View {
        VStack {
            SearchBar(viewModel: viewModel.searchViewModel).padding()
            List(viewModel.filteredValues, id: \.self) { item in
                Text(item)
            }
        }
    }
}

public extension ContentView {
    final class ViewModel {
        
        var searchViewModel: SearchBar.ViewModel
        
        var store: [String]

        @Published
        var filteredValues: [String]
        
        var subscription: AnyCancellable?
        
        init(searchViewModel: SearchBar.ViewModel, store: [String]) {
            self.searchViewModel = searchViewModel
            self.store = store
            self.filteredValues = store
        }
    }
}

extension ContentView.ViewModel: ObservableObject {}
