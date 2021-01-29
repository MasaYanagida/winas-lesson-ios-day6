//
//  SampleEmptyViewController.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/21.
//

import UIKit

import BonMot

class SampleEmptyViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - StoryboardInstantiable

extension SampleEmptyViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return String(describing: self)
    }
}
