//
//  SampleCollectionViewController.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/21.
//

import UIKit

class SampleCollectionViewController: UIViewController {
    private var contents = [Content2]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 0 ..< 20 {
            contents.append(Content2.create())
        }
    }
    
    @IBOutlet private dynamic weak var collectionView: UICollectionView! {
        didSet {
            collectionView.clipsToBounds = true
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.showsVerticalScrollIndicator = false
            collectionView.showsHorizontalScrollIndicator = false
            collectionView.backgroundColor = .clear
            collectionView.register(UINib(nibName: "Content2CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Content2CollectionViewCell")
        }
    }
}

// MARK: - UICollectionViewDataSource

extension SampleCollectionViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "Content2CollectionViewCell", for: indexPath
        ) as! Content2CollectionViewCell
        cell.content = contents[safe: indexPath.row]
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension SampleCollectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // do nothing
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SampleCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let content = contents[safe: indexPath.row] else { return .zero }
        return Content2CollectionViewCell.sizeForItem(content: content, width: collectionView.bounds.width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

// MARK: - StoryboardInstantiable

extension SampleCollectionViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return String(describing: self)
    }
}
