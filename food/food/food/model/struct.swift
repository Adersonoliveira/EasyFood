//
//  struct.swift
//  food
//
//  Created by Turma02-1 on 23/05/24.
//

import Foundation

struct HaPo: Codable, Hashable {
    let _id: String?
    let _rev: String?
    let nome: String?
//    let nome2: String?
//    let image: String?
    let alimento: [alimento]
    let bebida: [bebida]
   
}

struct alimento: Codable, Hashable {
    let nomealimento: String?
    let valoralimento: String?
    let image: String?
}

struct bebida: Codable, Hashable {
    let nomebebida: String?
    let valorbebida: String?
    let image: String?
}




