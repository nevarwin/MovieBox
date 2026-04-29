//
//  HorizontalListView.swift
//  MovieBox
//
//  Created by raven on 4/29/26.
//

import SwiftUI

struct HorizontalListView: View {
    let header : String
    var titles = [Constants.titleTestURL, Constants.titleTestURL2, Constants.titleTestURL3]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(header)
                .font(.title)
        }
        
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(titles, id: \.self) { title in
                    AsyncImage(url: URL(string: title)) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 10))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 120, height: 200)

                }
            }
        }
        .frame(height: 250)
        .padding(10)
    }
}

#Preview {
    HorizontalListView(header: Constants.trendingMovieString)
}
