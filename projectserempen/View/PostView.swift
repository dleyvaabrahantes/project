//
//  PostView.swift
//  projectserempen
//
//  Created by David on 10/29/21.
//

import SwiftUI

struct PostView: View {
    var post: Post
    @State var favorita = false
    @StateObject var viewModel = ViewModel()
    
    var placeIndex: Int {
        viewModel.posts!.firstIndex(where: {$0.id == post.id})!
    }
    
    
    var body: some View {
        //  HStack(spacing: 20){
        //   FavoriteBtn(isSet: $favorita)
        VStack(alignment: .leading, spacing: 10){
            HStack(alignment: .top, spacing: 10){
                if post.isRead  {
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 15, height: 15)
                }
                Text(post.title)
                    .font(.title)
                Spacer()
                if post.isFavorite  {
                    Image(systemName: "star.fill")
                } else {
                    Image(systemName: "star")
                }
            }
            
            Text(post.body)
                .font(.body)
                .onAppear{
                    print(post.isFavorite)
                }
            
        }
        .padding(.horizontal)
    }
}

//struct PostView_Previews: PreviewProvider {
//    static var previews: some View {
//        PostView(post: Post(userId: 3, id: 2, title: "sunt aut facere repellat provident occaecati excepturi optio reprehenderit", body: "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"))
//    }
//}
