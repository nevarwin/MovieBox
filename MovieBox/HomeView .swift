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
    }
}

#Preview {
    HomeView_()
}
