//
//  Array.swift
//  Drovox Passenger
//
//  Created by Eman Gaber on 2/27/21.
//

import Foundation

extension Array {
    func getElement(at index: Int) -> Element? {
        let isValidIndex = index >= 0 && index < count
        return isValidIndex ? self[index] : nil
    }
}
