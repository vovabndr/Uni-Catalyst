//
//  ContentView.swift
//  Unik
//
//  Created by Volodymyr Bondar on 08.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    TabView {
      VStack {
        Text("Request 1")
          .font(.body)
          .padding(10)
        List {
          ForEach(0...40, id: \.self) {
            Text("\($0)")
          }
          Text("Hello World")
        }
      }
      .tabItem {
        Image(systemName: "1.square.fill")
        Text("First")
      }

      Text("Another Tab")
        .tabItem {
          Image(systemName: "2.square.fill")
          Text("Second")
      }

      Text("The Last Tab")
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
