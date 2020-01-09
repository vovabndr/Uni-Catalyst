//
//  SResponse.swift
//  Unik
//
//  Created by Volodymyr Bondar on 09.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import Foundation

struct SResponse: Codable, Identifiable {
  let id: Int
  let bookNo, note: String
  let person: Person
  let financeId, diplomaId: Int

  struct Person: Codable {
    let id: Int
    let surname, name, patronymic, birthDate: String
    let sex, birthPlace, address, telephone: String
    let violations: [Violation]
    let sitizenId: Int

    struct Violation: Codable {
      let id: Int
      let violationDate: String
      let violationKind: Kind
      let order: Order
      let personId, violationKindId, orderId: Int

      struct Order: Codable {
        let id: Int
        let orderDate, orderNo, orderText: String
        let orderKind: Kind
        let orderKindId: Int
      }

      struct Kind: Codable {
        let id: Int
        let orderKindName, violationKindName: String?
      }
    }
  }
}
