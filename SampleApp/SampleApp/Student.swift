//
//  Student.swift
//  SampleApp
//
//  Created by Kunal Kumar R on 17/07/24.
//

import Foundation

struct Student: Codable {
    var name: String
    var grade: String
    var registerNumber: String
}

class StudentDB {
    static let shared = StudentDB()
    
    var students: [Student] = []
    var studentsInUserDefaults: [Student] = []
    
    // Saving in an array
    func saveStudent(_ student: Student) {
        //students.append(student)
        studentsInUserDefaults.append(student)
    }
    
    // Saving it in an array using UserDefaults
    func retrieveFromUserDefaults() {
        guard let data = UserDefaults.standard.data(forKey: "student") else {
            return
        }
        do {
            let decoder = JSONDecoder()
            let student = try decoder.decode(Student.self, from: data)
        }catch {
            debugPrint("Error", error)
        }
    }
}
