//
//  PhotoID.swift
//  PhotoFrame
//
//  Created by 박진섭 on 2022/02/18.
//

//랜덤으로 PhotoID를 뽑기 위한 enum과 CaseIterable프로토콜
enum PhotoID:String,CaseIterable {
    case one = "01"
    case two = "02"

    static var randomID:String {
        guard let randomID = PhotoID.allCases.randomElement()?.rawValue else { return ""}
        return randomID
    }

}
