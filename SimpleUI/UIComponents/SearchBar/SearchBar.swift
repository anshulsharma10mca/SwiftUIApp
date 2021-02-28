//
//  SearchBar.swift
//  SwiftUIApp
//
//  Created by Anshul Sharma on 2/27/21.
//

import SwiftUI
/**
 SearchBar is a reusable SwiftUI component,
it's functionality is to take user's text input
in search field and to publish any text change to
it's observing entity (e.g. item's list in this app)
*/
public struct SearchBar {
    @ObservedObject
    var viewModel: ViewModel
}

public extension SearchBar {
    class ViewModel {
        @Published
        var searchText: String
        
        init(searchText: String) {
            self.searchText = searchText
        }
    }
}

extension SearchBar: View {
    public var body: some View {
        TextField.init("Search...", text: $viewModel.searchText)
    }
}

extension SearchBar.ViewModel: ObservableObject {}
