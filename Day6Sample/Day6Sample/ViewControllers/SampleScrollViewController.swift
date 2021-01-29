//
//  SampleScrollViewController.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/21.
//

import UIKit

import BonMot

class SampleScrollViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.attributedText = """
        米民主党のジョー・バイデン新大統領（78）は20日正午前（日本時間21日未明）、首都ワシントンの連邦議会議事堂前で行われた就任宣誓式で、職務の遂行と合衆国憲法の堅持を宣誓し、第46代大統領に正式に就任した。バイデン氏は「米国の結束」をテーマに演説。「人々に団結を呼びかけこの国を一つにすることに私の全身全霊を注ぐ」と述べた。

        バイデン氏は新型コロナウイルス感染拡大や経済低迷、人種間格差など米国が複数の「危機と困難」に直面していると指摘する一方、「私たちはこれを乗り越える」と誓った。「私に投票しなかった人も含めすべての国民の大統領になる」と強調。今月6日に起きたトランプ前大統領支持者による議事堂乱入事件に触れ、「私たちは改めて、民主主義がいかに貴重でもろいものか学んだ。しかし、この瞬間、民主主義は勝利したのだ」と語った。

        バイデン氏は史上最高齢で米大統領に就任。副大統領には女性としても黒人としても初めてカマラ・ハリス元上院議員（56）が就いた
        """.styled(with: StringStyle(
            .font(.boldSystemFont(ofSize: 20)), .color(.black), .lineSpacing(8)
        ))
        /// view.setNeedsLayout() // == force update layout
        view.layoutIfNeeded() // == update layout if needed
    }
    
    @IBOutlet private dynamic weak var label: UILabel!
}

// MARK: - StoryboardInstantiable

extension SampleScrollViewController: StoryboardInstantiable {
    static var storyboardName: String {
        return String(describing: self)
    }
}

