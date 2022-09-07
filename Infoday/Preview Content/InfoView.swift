//
//  InfoView.swift
//  Infoday
//
//  Created by f2501029 on 7/9/2022.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack{
            Image("hkbu_logo")
                .resizable()
                .frame(width: 192.0, height: 192.0)
            Text("HKBU InfoDay App")
                .fontWeight(.bold)
                .font(.title)
            List {
                Section(header: Text("Important Numbers")) {
                    ForEach(Contact.data) { contact in 
                        HStack {
                            Image(systemName: "phone.fill.arrow.up.right")
                            Text(contact.office)
                            Spacer()
                            Text(contact.tel)
                } }
                }
                            Section(header: Text("Settings")) {
                                Text("Dark Mode")
                                Text("Light Mode")
                            }
            }
                        .padding(.top, 32.0)
                    }
                    .padding(.top, 32.0)
                }
            }
        

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}

struct Contact: Identifiable {
    var id = UUID()
    var office: String
    var tel: String
}

extension Contact {
    static let data = [
        Contact(office: "Admission Office", tel: "3411-2200"),
        Contact(office: "Emergencies", tel: "3411-7777"),
        Contact(office: "Health Services Center", tel: "3411-7447")
] }
