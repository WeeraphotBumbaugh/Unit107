//
//  DebugView.swift
//  Class105
//
//  Created by Weeraphot Bumbaugh on 9/13/25.
//

import SwiftUI

struct DebugView: View {
    let data: [Int]
    var body: some View {
        List(data, id: \.self) { item in
            Text("Item: \(item)")
        }
        .navigationTitle("Debug View")
    }
}
