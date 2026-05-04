//
//  HomeView .swift
//  MovieBox
//
//  Created by raven on 4/28/26.
//

import SwiftUI

struct HomeView: View {
    var titleTestURL = Constants.titleTestURL
    let viewModel = ViewModel()
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(.vertical) {
                switch viewModel.homeStatus {
                case .notStarted:
                    EmptyView()
                case .fetching:
                    ProgressView()
                case .success:
                    LazyVStack{
                        AsyncImage(url: URL(string: titleTestURL)){ image in
                            image
                                .resizable()
                                .scaledToFit()
                                .overlay{
                                    LinearGradient(stops: [Gradient.Stop(color: .clear, location: 0.8),
                                                           Gradient.Stop(color: .gradient, location: 1)],
                                                   startPoint: .top,
                                                   endPoint: .bottom)
                                }
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: geo.size.width, height: geo.size.height * 0.85)
                        
                        HStack{
                            Button{
                                
                            } label: {
                                Text(Constants.playString)
                                    .ghostButton()
                            }
                            
                            Button{
                                
                            } label: {
                                Text(Constants.downloadString)
                                    .ghostButton()
                            }
                        }
                        
                        HorizontalListView(header: Constants.trendingMovieString, titles: viewModel.trendingMovies)
                        HorizontalListView(header: Constants.trendingTVString, titles: viewModel.trendingTVShows)
                        HorizontalListView(header: Constants.topRatedMovieString, titles: viewModel.topRatedMovies)
                        HorizontalListView(header: Constants.topRatedTVString, titles: viewModel.topRatedTVShows)
                    }
                case .failed(let error):
                    Text("Error: \(error.localizedDescription)")
                    
                }
            }
            .task {
                await viewModel.getTitles()
            }
        }
    }
}

#Preview {
    HomeView()
}
