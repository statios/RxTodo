//
//  ModelType.swift
//  RxTodo
//
//  Created by Suyeol Jeon on 7/1/16.
//  Copyright © 2016 Suyeol Jeon. All rights reserved.
//

import Then
import Foundation

protocol Identifiable {
  associatedtype Identifier: Equatable
  var id: Identifier { get }
}

protocol ModelType: Then {
}

extension Collection where Self.Iterator.Element: Identifiable {

  func index(of element: Self.Iterator.Element) -> Self.Index? {
    return self.index { $0.id == element.id }
  }

}

/*
 - associatedtype :
    - type 알리아스랑 똑같지만 프로토콜에서 쓰인다
    - Equatable이랑 똑같고 이름만 다른 Identifier라는 타입을 정의 :line 12
 - Equatable :
    - == 연산자를 사용할 수 있는 타입 표준 라이브러리 대부분 이 타입을 따른다
    - 프로토콜 타입임
 -
 
 */

protocol Container {
    associatedtype Item
    mutating func append(_ item: Item)
    var count: Int { get }
    subscript(i: Int) -> Item { get }
}
