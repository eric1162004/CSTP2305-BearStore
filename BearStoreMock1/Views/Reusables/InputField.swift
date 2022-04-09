//
//  InputField.swift
//  BearStoreMock1
//
//  Created by eric on 2022-04-01.
//

import SwiftUI

struct InputField: View {
    
    @Binding var text: String
    var title: String = ""
    var placeHolder: String = ""
    var leadingIcon: String?
    var trailingIcon: String?
    var onTrailingIocnPressed: (()->Void)?
    var isPasswordField: Bool = false
    var height: CGFloat = Dm.xxlarge
    
    var body: some View {
        VStack{
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            if(!isPasswordField){
                HStack{
                    if let leadingIcon = leadingIcon {
                        Image(systemName: leadingIcon)
                    }
                    
                    TextField(placeHolder, text: $text)

                    if let trailingIcon = trailingIcon {
                        Image(systemName: trailingIcon)
                            .onTapGesture {
                                onTrailingIocnPressed?()
                            }
                    }
                }
                .padding()
                .frame(maxWidth:.infinity, minHeight: height)
                .overlay(
                    RoundedRectangle(cornerRadius: CornerRadius.small)
                        .stroke(Color.gray, lineWidth: 2)
                )
            } else {
                SecureField(
                    title,
                    text: $text
                )
                    .padding()
                    .frame(maxWidth:.infinity, minHeight: height)
                    .overlay(
                        RoundedRectangle(cornerRadius: CornerRadius.small)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            }
        }
    }
}

struct InputField_Previews: PreviewProvider {
    
    static var previews: some View {
        InputField(text: .constant("text"))
    }
}
