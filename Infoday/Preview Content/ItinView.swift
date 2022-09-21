//
//  ItinView.swift
//  Infoday
//
//  Created by f2501029 on 21/9/2022.
//

import SwiftUI

struct ItinView: View {
    //    @FetchRequest(entity: Event.entity(), sortDescriptors: [])
    //    var events: FetchedResults<Event>
    @FetchRequest var events: FetchedResults<Event>
    @Environment(\.managedObjectContext) private var viewContext
    
    init() {
        
        self._events = FetchRequest(
            entity: Event.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "saved = true")
        )
    }
    
    var body: some View {
        List(events) { event in
            HStack {
                Text(event.title ?? "")
                    .contextMenu {
                        Button("Remove from itinerary") {
                            viewContext.performAndWait {
                                event.saved = false
                            }
                        }
                    }
            }
        }
        .navigationTitle("My itinary")
    }
    
    struct ItinView_Previews: PreviewProvider {
        static var previews: some View {
            ItinView()
        }
    }
}
