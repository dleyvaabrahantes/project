//
//  PostView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import SwiftUI

struct PostView: View {
    var post: Post
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10){
            Text(post.title)
                .font(.title)
            Text(post.body)
                .font(.body)
                
        }
        .padding(.horizontal)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post: Post(userId: 3, id: 2, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"))
    }
}
