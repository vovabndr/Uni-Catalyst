//
//  FResponse.swift
//  Unik
//
//  Created by Volodymyr Bondar on 09.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import Foundation

struct FResponse: Codable, Identifiable {
  let id: Int
  let bookNo, note: String
  let studentGroups: [StudentGroup]
  let person: Person
  let financeId, diplomaId: Int

  struct StudentGroup: Codable {
    let group: Group
    let studentId, groupId: Int

    struct Group: Codable {
      let id: Int
      let groupCode: String
      let speciality: Speciality
      let specialityId: Int

      struct Speciality: Codable {
        let id: Int
        let specialityShifr, specialityName: String
        let cafedra: Cafedra
        let cafedraId: Int

        struct Cafedra: Codable {
          let id: Int
          let cafedraShifr, cafedraName: String
          let facultyId: Int
        }
      }
    }
  }

  struct Person: Codable {
    let id: Int
    let surname, name, patronymic, birthDate: String
    let sex, birthPlace, address, telephone: String
    let citizen: Citizen
    let sitizenId: Int

    struct Citizen: Codable {
      let id: Int
      let citizenName: String
    }
  }
}
