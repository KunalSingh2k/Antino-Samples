//
//  FloatingLabelTextField.swift
//  FloatingLabelTextField
//
//  Created by Kunal Kumar R on 12/08/24.
//

import SwiftUI

struct FloatingLabelTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .font(.system(text.isEmpty ? .title2: .title3))
                .foregroundStyle(.blue.opacity(0.5))
                .offset(y: text.isEmpty ? 0: -25)
                .scaleEffect(text.isEmpty ? 1: 0.9, anchor: .leading)
            
            TextField("", text: $text)
                .foregroundStyle(.blue)
        }
        .padding(.top, text.isEmpty ? 0 : 15)
        .animation(.default, value: 1)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(text.isEmpty ? .blue.opacity(0.5): .blue, lineWidth: 2)
        )
        .padding()
        
    }
}

#Preview {
    Group {
        FloatingLabelTextField(placeholder: "First Name", text: .constant(""))
        FloatingLabelTextField(placeholder: "First Name", text: .constant("Kunal"))
    }
}
