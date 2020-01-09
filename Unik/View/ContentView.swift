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
  @ObservedObject
  private var provider = DataProvider()
  private let width: CGFloat = 150

  var body: some View {
    TabView {
      VStack {
        List {
          Section(
            header: HStack {
              Text("Name").frame(width: self.width)
              Text("Surame").frame(width: self.width)
            }
          ) {
            ForEach(provider.fResponse) { (res: FResponse) in
              HStack {
                Text(res.person.name).frame(width: self.width)
                Text(res.person.surname).frame(width: self.width)
              }
            }
          }
        }
      }
      .onAppear(perform: self.provider.get1)
      .tabItem {
        Image(systemName: "1.square.fill")
        Text("First")
      }

      Text("Another Tab")
        .onAppear(perform: self.provider.get2)
        .tabItem {
          Image(systemName: "2.square.fill")
          Text("Second")
      }

      Text("The Last Tab")
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
