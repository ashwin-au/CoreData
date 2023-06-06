//
//  StudentListView.swift
//  CoreDataTraining
//
//  Created by Ashwin A U on 06/06/23.
//

import SwiftUI

struct StudentListView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(students) { student in
                        Text("\(student.firstName ?? "") " + "\(student.secondName ?? "")")
                    }.onDelete(perform: deleteItem)
                }
                Button("Add") {
                    self.addStudent()
                }
            }.navigationTitle("Student List")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
            }
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let student = students[offset]
            moc.delete(student)
        }
        try? moc.save()
    }
    
    func addStudent() {
        let firstNames = ["John", "Sam", "Kiran", "Surya", "JayaSree", "Ron", "Harry"]
        let LastNames = ["Bernald", "Jacob", "Sibi", "Kajol", "Soor", "Khor", "Potter"]
        
        let student = Student(context: moc)
        student.id = UUID()
        student.firstName = firstNames.randomElement()
        student.secondName = LastNames.randomElement()
        
        try? moc.save()
    }
}

struct StudentListView_Previews: PreviewProvider {
    static var previews: some View {
        TempView()
    }
}

struct TempView: View {
    @State var switchView = false
    @State var view: ViewType = .circle
    var body: some View {
        VStack {
            dynamicView
                .frame(width: 200, height: 200)
            Text("change View")
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .onTapGesture {
                    withAnimation(.spring()) {
                        self.view = .square
                    }
                }
        }
    }
    @ViewBuilder
    var dynamicView: some View {
        switch self.view {
        case .circle:
            Circle()
        case .rectangle:
            Rectangle()
        case .square:
            RoundedRectangle(cornerSize: CGSize(width: 100, height: 100))
        }
    }
}

enum ViewType: CaseIterable {
    case rectangle
    case circle
    case square
}
