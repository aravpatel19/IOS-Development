//
//  LandmarkDetail.swift
//  Landmarks
//
//  Created by Arav Patel on 3/7/23.
//

import SwiftUI

struct LandmarkDetail: View {
    
    @EnvironmentObject var modelData: ModelData
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height:300)
            
            CircleImage(image: landmark.image)
                .offset(y: -150)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    .fontWeight(.black)
                    FavoriteButton(isSet: $modelData.landmarks[landmarkIndex].isFavorite)
                }
                    
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.title2)
                    .fontWeight(.bold)
                Text(landmark.description)
            }
            .padding()
        }
        .navigationTitle(landmark.name)
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(edges: .top)
    }
}

struct LandmarkDetail_Previews: PreviewProvider {
    static let modelData = ModelData()
    
    static var previews: some View {
        LandmarkDetail(landmark: ModelData().landmarks[0])
            .environmentObject(modelData)
    }
}
