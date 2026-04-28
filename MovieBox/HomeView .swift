//
//  HomeView .swift
//  MovieBox
//
//  Created by raven on 4/28/26.
//

import SwiftUI

struct HomeView_: View {
    let titleTestURL = Constants.titleTestURL
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: titleTestURL)){ image in
                image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
        }
        HStack{
            Button{
                
            } label: {
                Text(Constants.playString)
                    .frame(width: 100, height: 50)
                    .bold()
                    .background(){
                        RoundedRectangle(cornerRadius: 20, style: .continuous)
                            .stroke(lineWidth: 5)
                    }
            }
            
            Button{
                
            } label: {
                Text(Constants.downloadString)
            }
        }
    }
}

#Preview {
    HomeView_()
}
