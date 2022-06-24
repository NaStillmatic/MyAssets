//
//  AssetSummaryData.swift
//  MyAssets
//
//  Created by HwangByungJo  on 2022/06/24.
//

import SwiftUI

class AssetSummaryData: ObservableObject {

  @Published var asset: [Asset] = load("assets.json")
}

func load<T: Decodable>(_ fileName: String) -> T {
  let data: Data
  
  guard let file = Bundle.main.url(forResource: fileName, withExtension: nil) else {
    fatalError(fileName + "을 찾을 수 없습니다.")
  }
  
  do {
    data = try Data(contentsOf: file)
  } catch {
    fatalError(fileName + "을 찾을 수 없습니다.2")
  }
  
  do {
    let decoder = JSONDecoder()
    return try decoder.decode(T.self, from: data)
  } catch {
    fatalError(fileName + "을 \(T.self)로 파싱할 수 없습니다. ")
  }
}
