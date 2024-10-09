//
//  DetailView.swift
//  ToDoList
//
//  Created by Theodore Utomo on 10/9/24.
//

import SwiftUI

struct DetailView: View {
    var passedValue: String // Don't initialize it - it will be passed from parent view
    @Environment(\.dismiss) private var dismiss //Dismisses a screen
    var body: some View {
        VStack {
            Spacer()
            Image(systemName: "swift")
                .resizable()
                .scaledToFit()
                .foregroundStyle(.orange)
            
            Text("You Are a Swifty Legend!\nAnd you passed over the value: \(passedValue)")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            Spacer()
            Button("Get Back!") {
                dismiss() //Dismisses a screen
            }
        }
        .padding()
    }
}

#Preview {
    DetailView(passedValue: "")
}
