//
//  FloatingBorderTextField.swift
//  FloatingLabelTextField
//
//  Created by Kunal Kumar R on 12/08/24.
//

import SwiftUI

struct FloatingBorderTextField: View {
    let placeholder: String
    @Binding var text: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .font(.system(text.isEmpty ? .title2: .title3))
                .foregroundStyle(.blue.opacity(0.5))
                .padding(.horizontal, text.isEmpty ? 0: 5)
                .background(.white)
                .offset(y: text.isEmpty ? 0: -32)
                .scaleEffect(text.isEmpty ? 1: 0.9, anchor: .leading)
            
            
            TextField("", text: $text)
                .font(.title3)
                .foregroundStyle(.blue)
        }
        .padding(.horizontal)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(text.isEmpty ? .blue.opacity(0.5): .blue, lineWidth: 2)
        )
        .animation(.easeOut, value: 1)
        .padding()
        
    }
}

#Preview {
    Group {
        FloatingBorderTextField(placeholder: "First Name", text: .constant(""))
        FloatingBorderTextField(placeholder: "First Name", text: .constant("Kunal"))
    }
}
