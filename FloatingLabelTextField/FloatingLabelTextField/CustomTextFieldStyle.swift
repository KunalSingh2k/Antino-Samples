//
//  CustomTextFieldStyle.swift
//  FloatingLabelTextField
//
//  Created by Kunal Kumar R on 12/08/24.
//

import SwiftUI

struct CustomTextFieldStyle: TextFieldStyle {
    let placeholder: String
    let placeholderColor: Color
    let placeholderBgColor: Color
    var isEditing: Bool
    
    func _body(configuration: TextField<_Label>) -> some View {
        ZStack(alignment: .leading) {
            Text(placeholder)
                .font(.system(isEditing ? .title3: .title2))
                .foregroundStyle(placeholderColor.opacity(0.5))
                .padding(.horizontal, isEditing ? 10: 0)
            // Text background color when placed between border
                .background(placeholderBgColor)
                .offset(y: isEditing ? -32: 0)
                .scaleEffect(isEditing ? 0.9: 1)
            
            configuration
                .font(.system(.title2, design: .rounded))
                .foregroundStyle(placeholderColor)
        }
        .padding(.horizontal)
        .padding(.vertical, 15)
        .background(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isEditing ? placeholderColor: placeholderColor.opacity(0.5), lineWidth: 2)
        )
        .animation(.default,value: 1)
    }
}
