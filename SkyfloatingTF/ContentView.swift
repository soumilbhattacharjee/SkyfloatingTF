//
//  ContentView.swift
//  SkyfloatingTF
//
//  Created by Soumil on 9/7/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            SkyFloatingTF(tfBGColor: Color.red)
            .padding()
        }
        .background(Color.red)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
