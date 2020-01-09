//
//  DataProvider.swift
//  Unik
//
//  Created by Volodymyr Bondar on 09.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import Foundation
import Combine

final class DataProvider: ObservableObject {
  private var cancellables = Set<AnyCancellable>()
  static let baseURL = "http://localhost:5001/api/v2/"

  @Published var fResponse: [FResponse] = []
  @Published var sResponse: [SResponse] = []
  @Published var tResponse: [TResponse] = []

  func get1(groupName: String = "IK-62") {
    if let url = URL(string: DataProvider.baseURL + "1?groupCode=\(groupName)") {
      get(url, set: \.fResponse)
    }
  }

  func get2() {
    let url = URL(string: DataProvider.baseURL + "2")!
    get(url, set: \.sResponse)
  }

  func get3() {
    let url = URL(string: DataProvider.baseURL + "3")!
    get(url, set: \.tResponse)
  }

  private func get<JSON>(_ url: URL, set keyPath: ReferenceWritableKeyPath<DataProvider, [JSON]>) where JSON: Decodable {
    URLSession.shared.dataTaskPublisher(for: url)
      .map(\.data)
      .decode(type: [JSON].self, decoder: JSONDecoder())
      .replaceError(with: [])
      .receive(on: RunLoop.main)
      .assign(to: keyPath, on: self)
      .store(in: &cancellables)
  }
}
