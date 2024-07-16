//
//  CurrentDate.swift
//  GettingStartedAsyncAwait
//
//  Created by Maurício Sayão on 13/07/24.
//

import Foundation

struct CurrentDate: Decodable, Identifiable {
    let id = UUID()
    let date: String
    
    private enum CodingKeys: String, CodingKey {
        case date = "date"
    }
}
