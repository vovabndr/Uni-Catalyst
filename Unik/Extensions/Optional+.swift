//
//  Optional+.swift
//  Unik
//
//  Created by Volodymyr Bondar on 08.01.2020.
//  Copyright © 2020 Volodymyr Bondar. All rights reserved.
//

import Foundation

extension Optional {
  func on(work: (Wrapped) -> Void) -> Wrapped?  {
    if let value = self {
      work(value)
    }
    return self
  }
}
