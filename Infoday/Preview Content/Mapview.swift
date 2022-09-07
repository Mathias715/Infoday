//
//  Mapview.swift
//  Infoday
//
//  Created by f2501029 on 7/9/2022.
//

import SwiftUI
import MapKit
struct MapView: View {
    @State private var region =
    MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 22.33787,
            longitude: 114.18131
        ),
        span: MKCoordinateSpan(
            latitudeDelta: 0.005,
            longitudeDelta: 0.005
        )
    )
    var body: some View {
        Map(coordinateRegion: $region,
        annotationItems: Building.campusBuildings) {
        building in
            MapMarker(coordinate:
        building.coordinate)
        }
        .edgesIgnoringSafeArea(.top) // show the edge of the region
}
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}

struct Building: Identifiable {
    var id = UUID()
    let title: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    } }
    extension Building {
        static let campusBuildings: [Building] = [
            Building(title: "AC Hall", latitude: 22.341280, longitude:
    114.179768),
            Building(title: "Lam Woo International Conference Center", latitude:
    22.337716, longitude: 114.182013),
            Building(title: "Communication and Visual Arts Building", latitude:
    22.334382, longitude: 114.182528)
        ]
    }

