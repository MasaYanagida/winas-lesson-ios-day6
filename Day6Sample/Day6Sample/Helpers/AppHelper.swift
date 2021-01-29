//
//  AppHelper.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/22.
//

import Foundation

// Singleton
class AppHelper {
    static let shared = AppHelper()
    var data: Content = Content.create()
}
