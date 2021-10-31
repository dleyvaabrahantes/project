//
//  FavoriteBtn.swift
//  projectserempen
//
//  Created by David on 10/30/21.
//

import SwiftUI

struct FavoriteBtn: View {
    
    @Binding var isSet: Bool
    
    var body: some View {
        Button(action: {
            isSet.toggle()
        }, label: {
            Image(systemName: isSet ? "star.fill" : "star")
                .foregroundColor(isSet ? Color.yellow : Color.gray)
                .font(.system(size: 20))
        })
    }
    
}

struct FavoriteBtn_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteBtn(isSet: .constant(true))
    }
}
