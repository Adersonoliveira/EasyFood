//
//  Api.swift
//  food
//
//  Created by Turma02-1 on 23/05/24.
//

import Foundation

class ViewModel: ObservableObject {
    @Published var chars: [HaPo] = []
    @Published var ali: [alimento] = []
    @Published var bebi: [bebida] = []

    func fetch(){
        guard let url = URL (string: "http://192.168.128.22:1880/reading") else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in

            guard let data = data, error == nil else{
                return
            }

            do{
                let parsed = try JSONDecoder().decode([HaPo].self, from: data)
                DispatchQueue.main.async{
                    self?.chars = parsed
                }
            }catch{
                print(error)
            }

        }
        task.resume()


    }

}



