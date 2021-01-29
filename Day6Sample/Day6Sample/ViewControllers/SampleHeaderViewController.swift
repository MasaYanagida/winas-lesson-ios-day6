//
//  SampleHeaderViewController.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/20.
//

import UIKit

import SnapKit

class SampleHeaderViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let header = SampleHeader.createFromNib()
        header.delegate = self
        header.content = Content.create()
//        header.closure = { [weak self] in
//            self?.view.backgroundColor = .black
//        }
        view.addSubview(header)
        header.snp.makeConstraints { make in
            make.top.equalTo(0)
            make.left.equalTo(0)
            make.right.equalTo(0)
        }
    }
    
    deinit {
        print("#issue SampleHeaderViewController deinit!!")
    }
}

// MARK: - SampleHeaderDelegate

extension SampleHeaderViewController: SampleHeaderDelegate {
    func sampleHeader(iconTouchUpInside view: SampleHeader) {
        // do nothing
    }
}

// MARK: - StoryboardInstantiable

extension SampleHeaderViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return String(describing: self)
    }
}
