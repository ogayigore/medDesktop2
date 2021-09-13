//
//  HTMLFile.swift
//  MedDesktop
//
//  Created by Igor Ogai on 01.09.2021.
//

import Foundation

class HTMLFile {
    func getHtmlPage(patient: Patient, visit: Visit) -> String {
        guard let patronymic = patient.patronymic else { return "" }
        let patientFullName = "\(patient.surname) \(patient.name) \(patronymic)"
        let age = calcAge(birthday: patient.dateOfBirth)
        let html = 
            """
            <html>
            <head>
                <br>
                    <style>
                    body {
                        margin: 0;
                    }
                    .child {
                        margin-left: 70px;
                        margin-right: 70px;
                        margin-bottom: 70px;
                    }
                    </style>
            </head>
            <body>
                <div class="parent">
                <h3 align="center">Консультация невролога</h3>
                    <div class="child">
                    <font size=2>
                        <b>Номер карты: \(patient.cardNumber)<br>
                        ФИО: \(patientFullName)<br>
                        Дата рождения: \(patient.dateOfBirth)<br>
                        Возраст: \(age!)<br>
                        Дата приёма: \(visit.date)<br>
                        \(visit.procedureName)
                        <p>Жалобы:</b><br>
                        \(visit.complaint)</p>
                        <p><b>Анамнез:</b><br>
                        \(visit.anamnesis)</p>
                        <p><b>Статус:</b><br>
                        \(visit.status)</p>
                        <p><b>Диагноз:</b><br>
                        \(visit.diagnosis)</p>
                        <p><b>Назначение:</b><br>
                        \(visit.appointment)</p>
                        <p><b>Рекомендации:</b><br>
                        \(visit.recomendation)</p><br>
                        <p><b>Врач Цой Лариса Семеновна</b><br>
                        \(visit.date)</p>
                    </font>
                    </div>
                </div>
            </body>
            </html>
            """
        return html
    }
    
    private func calcAge(birthday: String) -> String! {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy"
        let birthdayDate = dateFormatter.date(from: birthday)
        let now = Date()
        let calendar = Calendar.current
        
        let calcAge = calendar.dateComponents([.year, .month], from: birthdayDate!, to: now)
        guard let age = calcAge.year else { return "0" }
        if age == 0 {
            guard let month = calcAge.month else { return "0" }
            return "\(month)мес."
        } else {
            return "\(age)"
        }
    }
}
