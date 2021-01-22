//
//  Array+Util.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/20.
//

import Foundation

extension Array {
    subscript (safe index: Int) -> Element? {
        get {
            return self.indices ~= index ? self[index] : nil
        }
        set {
            guard let value = newValue  else {
                return
            }
            if !(self.indices ~= index) {
                print("WARN: Array index out of range, so ignored. (array:\(self))")
                return
            }
            self[index] = value
        }
    }
}
