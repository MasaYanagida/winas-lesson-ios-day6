//
//  Content2CollectionViewCell.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/21.
//

import UIKit
import BonMot

// MARK: - Content2CollectionViewCell

class Content2CollectionViewCell: UICollectionViewCell {
    
    // MARK: Class
    
    struct Static {
        static var cell = Content2CollectionViewCell.fromNib()
        static let cache = NSCache<NSString, NSValue>()
    }
    
    class func sizeForItem(content: Content2, width: CGFloat) -> CGSize {
        let cacheKey: NSString = "Content2CollectionViewCell:\(content.id)" as NSString
        if let size = Static.cache.object(forKey: cacheKey) as? CGSize {
            return size
        }
        let cell = Static.cell
        cell.dummy = content
        cell.frame.size = CGSize(width: width, height: 0)
        cell.setNeedsLayout()
        var size = cell.systemLayoutSizeFitting(
            CGSize(width: width, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .defaultLow
        )
        size.width = width
        Static.cache.setObject(NSValue(cgSize: size), forKey: cacheKey)
        return size
    }
    
    var dummy: Content2? {
        didSet {
            guard let content = self.dummy else {
                return
            }
            updateView(content, isSampling: true)
        }
    }
    
    var content: Content2? = nil {
        didSet {
            guard let content = self.content else {
                return
            }
            updateView(content, isSampling: false)
        }
    }
    
    private func updateView(_ content: Content2, isSampling: Bool = false) {
        if !isSampling {
            // iconView has fixed size, so not required load image when the cell is sampled size
            iconView.loadKingfisherImage(URL(string: "https://avatars2.githubusercontent.com/u/34995624?s=460&u=8e5fca49d0330448b3e7d4d32c30b98afb7fbf61&v=4")!)
        }
        contentLabel.attributedText = content.text.styled(with: StringStyle(
            .font(.systemFont(ofSize: 16)), .color(.gray), .lineSpacing(6)
        ))
        layoutIfNeeded()
    }
    
    @IBOutlet weak var containerView: UIView! {
        didSet {
            containerView.layer.masksToBounds = false
            containerView.layer.shadowColor = UIColor.black.cgColor
            containerView.layer.shadowOpacity = 0.3
            containerView.layer.shadowOffset = CGSize(width: 0, height: 0)
            containerView.layer.shadowRadius = 1
        }
    }
    @IBOutlet private dynamic weak var iconView: UIImageView!
    @IBOutlet private dynamic weak var contentLabel: UILabel!
}

// MARK: - XibInstantiable

extension Content2CollectionViewCell: XibInstantiable {
    static var nibName: String {
        return String(describing: self)
    }
}
