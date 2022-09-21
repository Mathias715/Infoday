//
//  EventView.swift
//  Infoday
//
//  Created by f2501029 on 7/9/2022.
//

import SwiftUI

struct EventView: View {
//    @FetchRequest(entity: Event.entity(), sortDescriptors: [])
//    var events: FetchedResults<Event>
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest var events: FetchedResults<Event>

    init(dept_id: String) {
        
        self.dept_id = dept_id
        
        self._events = FetchRequest(
            entity: Event.entity(),
            sortDescriptors: [],
            predicate: NSPredicate(format: "dept_id == %@", dept_id)
        )
    }
    
    var dept_id = ""
    var body: some View {
        List(events.filter { $0.dept_id == dept_id }) { event in
            HStack {
                Text(event.title ?? "")
                    .contextMenu {
                        Button("Add To itinerary") {
                            viewContext.performAndWait {
                                event.saved = true
                                try? viewContext.save()
                            }
                        }
                    }
            }
        }
        .navigationTitle(dept_id)
    }

    struct EventView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                EventView(dept_id: "coms")
            }
        }
    }
}


//struct Event: Identifiable {
//    let id = UUID()
//    let title: String
//    let dept_id: String
//    var saved: Bool
//}
//
//extension Event {
//    static let data: [Event] = [
//        Event(title: "Career Talks", dept_id: "coms", saved: false),
//        Event(title: "Guided Tour", dept_id: "coms", saved: true),
//        Event(title: "MindDrive Demo", dept_id: "comp", saved: false),
//        Event(title: "Project Demo", dept_id: "comp", saved: false)
//    ] }
