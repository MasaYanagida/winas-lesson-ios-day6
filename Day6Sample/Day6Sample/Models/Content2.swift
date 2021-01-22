//
//  Content2.swift
//  Day6Sample
//
//  Created by 柳田昌弘 on 2021/01/21.
//

import Foundation

// MARK: Content2

class Content2: NSObject {
    var id: Int = 0
    var text: String = ""
    
    static func create() -> Content2 {
        let index = randomValue([1,2,3,4])
        let ret = Content2()
        ret.id = index
        switch index {
        case 1: ret.text = "こんにちは"
        case 2: ret.text = "私の名前は柳田昌弘です。ソフトウエアエンジニアです"
        case 3: ret.text = "私の名前は柳田昌弘です。ソフトウエアエンジニアです。モバイルアプリ(iOS/Android)が得意です"
        case 4: ret.text = "私の名前は柳田昌弘です。ソフトウエアエンジニアです。モバイルアプリ(iOS/Android)が得意です。趣味はお酒、特にウイスキー🥃が好きでよく近所のバーで夜な夜な一人で飲みに行っていますが現在緊急事態宣言中であまり飲みに行けていません💧"
        default: break
        }
        return ret
    }
}
