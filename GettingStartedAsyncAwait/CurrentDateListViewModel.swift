//
//  CurrentDateListViewModel.swift
//  GettingStartedAsyncAwait
//
//  Created by Maurício Sayão on 13/07/24.
//

import Foundation

@MainActor
class CurrentDateListViewModel: ObservableObject {
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDates() async {
        do {
            if let currentDate = try await WebService().getDates() {
                let viewModel = CurrentDateViewModel(currentDate: currentDate)
                self.currentDates.append(viewModel)
            }
        } catch {
            print(error)
        }
    }
}

struct CurrentDateViewModel {
    let currentDate: CurrentDate
    
    var id: UUID {
        currentDate.id
    }
    
    var date: String {
        currentDate.date
    }
}
