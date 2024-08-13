//
//  HomeView.swift
//  FloatingLabelTextField
//
//  Created by Kunal Kumar R on 12/08/24.
//

import SwiftUI

struct HomeView: View {
    @State private var text: String = ""
    @State private var text1: String = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
//            FloatingLabelTextField(placeholder: "First Name", text: $text)
//            FloatingLabelTextField(placeholder: "Last Name", text: $text1)
         
//            FloatingBorderTextField(placeholder: "First Name", text: $text)
//            FloatingBorderTextField(placeholder: "last Name", text: $text1)
            
            TextField("", text: $text)
                .textFieldStyle(CustomTextFieldStyle(placeholder: "First Name",
                                                     placeholderColor: .black,
                                                     placeholderBgColor: .white,
                                                     isEditing: !text.isEmpty)
                )
            TextField("", text: $text1)
                .textFieldStyle(CustomTextFieldStyle(placeholder: "Last Name",
                                                     placeholderColor: .black,
                                                     placeholderBgColor: .white,
                                                     isEditing: !text1.isEmpty)
                )
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
