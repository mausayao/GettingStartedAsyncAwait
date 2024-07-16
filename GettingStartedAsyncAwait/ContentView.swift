//
//  ContentView.swift
//  GettingStartedAsyncAwait
//
//  Created by Mohammad Azam on 7/9/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CurrentDateListViewModel()

    var body: some View {
        NavigationView {
            List(viewModel.currentDates, id: \.id) { item in
                Text(item.date)
            }.listStyle(.plain)
            
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                Task.init(operation: {
                   await viewModel.populateDates()
                })
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
               await viewModel.populateDates()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
