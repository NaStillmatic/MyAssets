//
//  AssetSummaryView.swift
//  MyAssets
//
//  Created by HwangByungJo  on 2022/06/24.
//

import SwiftUI

struct AssetSummaryView: View {
  
  @EnvironmentObject var assetData: AssetSummaryData
  
  var asset: [Asset] {
    return assetData.asset
  }
    var body: some View {
      VStack(spacing: 20) {
        ForEach(asset) { asset in
          switch asset.type {
          case .creditCard:
            AssetCardSectionView(asset: asset)
              .frame(idealHeight: 250)
          default:
            AssetSectionView(assetSection: asset)
          }
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
      }
      .padding()
    }
}

struct AssetSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        AssetSummaryView()
        .environmentObject(AssetSummaryData())
        .background(Color.gray.opacity(0.2))
    }
}
