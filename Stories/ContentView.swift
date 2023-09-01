//
//  ContentView.swift
//  Stories
//
//  Created by Pinar Olguc on 31.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            CategoryHome().environmentObject(ModelData())
        }
        .padding(.zero)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(ModelData())
    }
}
