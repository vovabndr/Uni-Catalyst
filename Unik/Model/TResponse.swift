//
//  TResponse.swift
//  Unik
//
//  Created by Volodymyr Bondar on 09.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import Foundation

// MARK: - WelcomeElement
struct TResponse: Codable, Identifiable {
  let id: Int
  let bookNo, note: String
  let contracts: [Contract]
  let person: Person
  let financeId, diplomaId: Int

  struct Person: Codable {
    let id: Int
    let surname, name, patronymic, birthDate: String
    let sex, birthPlace, address, telephone: String
    let personPrivileges: [PersonPrivilege]
    let sitizenId: Int

    struct PersonPrivilege: Codable {
      let privBeginDate, privEndDate: String
      let ground: String
      let privilege: ContractKind
      let personId, privilegeId: Int
    }
  }

  struct Contract: Codable {
    let id: Int
    let payerKind: String
    let contractKind: ContractKind
    let studentId, contractKindId: Int
  }

  struct ContractKind: Codable {
    let id: Int
    let contractKindName, privilegeName: String?
  }
}
