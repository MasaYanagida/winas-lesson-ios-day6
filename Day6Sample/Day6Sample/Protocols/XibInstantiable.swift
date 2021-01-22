//
//  XibInstantiable.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/21.
//

import UIKit

protocol XibInstantiable {
    static var nibName: String { get }
}

extension XibInstantiable where Self: UIView {
    static func fromNib() -> Self {
        let xib = UINib(nibName: nibName, bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "生成したいviewと同じ名前のXibFileが見つからないか、viewに正しくクラスが設定されていない可能性があります。")
        }
        return view!
    }
    static func fromNib(by name: String) -> Self {
        let xib = UINib(nibName: name, bundle: nil)
        let view = xib.instantiate(withOwner: nil, options: nil)[0] as? Self
        if view == nil {
            assert(false, "生成したいviewと同じ名前のXibFileが見つからないか、viewに正しくクラスが設定されていない可能性があります。")
        }
        return view!
    }
}
