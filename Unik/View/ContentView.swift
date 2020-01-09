//
//  ContentView.swift
//  Unik
//
//  Created by Volodymyr Bondar on 08.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct ContentView: View {
  @ObservedObject private var provider = DataProvider()
  @State private var groupName = "IK-62"

  private let width: CGFloat = 175

  var body: some View {
    TabView {
      VStack {
        Text(#"Вивести студентів групи \#(self.groupName), які навчаються на спеціальності "Автоматизація" на кафедрі "Технічна Кібернетика", які є киянами."#)
          .padding(8)
          .font(.largeTitle)

        HStack {
          Text("Enter group: ")
          TextField("", text: $groupName, onCommit: {
            self.provider.get1(groupName: self.groupName)
          }).textFieldStyle(RoundedBorderTextFieldStyle())
        }
        .padding(8)
        List {
          Section(
            header: HStack {
              Text("Name").frame(width: self.width)
              Text("Surame").frame(width: self.width)
              Text("GroupNo").frame(width: self.width)
              Text("BookNo").frame(width: self.width)
              Text("Speciality Name").frame(width: self.width)
              Text("Cafedra Name").frame(width: self.width)
              Text("Citizen Name").frame(width: self.width)
            }
          ) {
            ForEach(provider.fResponse) { (res: FResponse) in
              HStack {
                Text(res.person.name).frame(width: self.width)
                Text(res.person.surname).frame(width: self.width)
                Text(res.studentGroups[0].group.groupCode).frame(width: self.width)
                Text(res.bookNo).frame(width: self.width)
                Text(res.studentGroups[0].group.speciality.specialityName).frame(width: self.width)
                Text(res.studentGroups[0].group.speciality.cafedra.cafedraName).frame(width: self.width)
                Text(res.person.citizen.citizenName).frame(width: self.width)
              }
            }
          }
        }
      }
      .onAppear { self.provider.get1() }
      .tabItem {
        Image(systemName: "1.square.fill")
        Text("First")
      }

      VStack {
        Text(#"Вивести студентів, які скоїли певні правопорушення та потрапили до наказу на відрахування."#)
          .padding(8)
          .font(.largeTitle)
        List {
          Section(
            header: HStack {
              Text("Name").frame(width: self.width)
              Text("Surame").frame(width: self.width)
              Text("Violation Kind Name").frame(width: self.width)
              Text("Order Kind Name").frame(width: self.width)
            }
          ) {
            ForEach(provider.sResponse) { (res: SResponse) in
              HStack {
                Text(res.person.name).frame(width: self.width)
                Text(res.person.surname).frame(width: self.width)
                Text(res.person.violations[0].violationKind.violationKindName ?? "").frame(width: self.width)
                Text(res.person.violations[0].order.orderKind.orderKindName ?? "").frame(width: self.width)
              }
            }
          }
        }
      }
      .onAppear(perform: self.provider.get2)
      .tabItem {
        Image(systemName: "2.square.fill")
        Text("Second")
      }

      VStack {
        Text(#"Вивести ПІБ студентів контрактників з індівідуальним контрактом, що мають певні привілеї."#)
          .padding(8)
          .font(.largeTitle)
        List {
          Section(
            header: HStack {
              Text("Name").frame(width: self.width)
              Text("Surame").frame(width: self.width)
              Text("Patronymic").frame(width: self.width)
              Text("Сontract Kind Name").frame(width: self.width)
              Text("Privilege Name").frame(width: self.width)
            }
          ) {
            ForEach(provider.tResponse) { (res: TResponse) in
              HStack {
                Text(res.person.name).frame(width: self.width)
                Text(res.person.surname).frame(width: self.width)
                Text(res.person.patronymic).frame(width: self.width)
                Text(res.contracts[0].contractKind.contractKindName ?? "").frame(width: self.width)
                Text(res.person.personPrivileges[0].privilege.privilegeName ?? "").frame(width: self.width)
              }
            }
          }
        }
      }
      .onAppear(perform: self.provider.get3)
      .tabItem {
        Image(systemName: "3.square.fill")
        Text("Third")
      }
    }
    .font(.headline)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
