//
//  SampleHeader.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/20.
//

import UIKit
import BonMot

// MARK: SampleHeaderDelegate

protocol SampleHeaderDelegate : class {
    func sampleHeader(iconTouchUpInside view: SampleHeader)
}

// MARK: SampleHeader

class SampleHeader: UIView {
    
    weak var delegate: SampleHeaderDelegate?
    var closure: (() -> Void)?
    var content: Content? {
        didSet {
            guard let content = self.content else { return }
            imageView.loadKingfisherImage(URL(string: "https://avatars2.githubusercontent.com/u/34995624?s=460&u=8e5fca49d0330448b3e7d4d32c30b98afb7fbf61&v=4")!)
            textLabel.text = content.name
//            DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: { [weak self] in
//                guard let `self` = self else { return }
//                print("#issue SampleHeader update!!")
//                self.textLabel.text = content.address
//            })
        }
    }
    
    @IBOutlet private dynamic weak var imageView: UIImageView!
    @IBOutlet private dynamic weak var textLabel: UILabel!
    deinit {
        print("#issue SampleHeader deinit!!")
        //NotificationCenter.default.removeObserver(self, name: .SampleNotification, object: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(onSampleNotification(_:)),
            name: .SampleNotification, object: nil
        )
    }
    
    @objc private func onSampleNotification(_ notification: Foundation.Notification) {
        print("#issue onSampleNotification")
    }
    
    class func createFromNib() -> SampleHeader {
        let xib = UINib(nibName: "SampleHeader", bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "Xib Load Error!!")
        }
        return view!
    }
}
