//
//  ContentView.swift
//  PedraPapelTesoura
//
//  Created by Tatiana Pessoa Fernandes on 22/02/22.
//

import SwiftUI

struct ContentView: View {
    
    @State var pontosPc = 0
    @State var pontosJogador = 0
    
    @State var imagemPc = "pedra"
    @State var imagemJogador = "pedra"
    
    
    
    var body: some View {
        
        //Layout Vertical
        VStack {
            
            
            //Pontos PC
            Text("Pontos: \(pontosPc)")
                .font(.system(size: 24))
                .bold()
            
            //Imagem PC
            Image(imagemPc)
            
            
            //Imagem Jogador
            Image(imagemJogador)
                .onTapGesture {
                    //mao PC
                    let pcToque = Int.random(in: 1...3)
                    imagemPc = imageGenerator(pcToque)
                    
                    
                    
                    //minha mao
                    let meuToque = Int.random(in: 1...3)
                    imagemJogador = imageGenerator(meuToque)
                    
                    calcularPontos(meuToque, pcToque)
                }
            
            
            //Pontos Jogador
            Text("Pontos: \(pontosJogador)")
                .font(.system(size: 24))
                .bold()
            
        }
       
    }
    
    func imageGenerator(_ num: Int) -> String {
        if num == 1 {
            return "pedra"
        } else if num == 2 {
            return "papel"
        } else if num == 3 {
            return "tesoura"
        }
        return "pedra"
    }
    
    func calcularPontos(_ meu: Int, _ pc: Int) {
        
        // 1 = pedra, 2 = papel, 3 = tesoura
        
        if meu == 1 && pc == 2 {
            pontosPc = pontosPc + 1
        }
        
        if meu == 1 && pc == 3 {
            pontosJogador = pontosJogador + 1
        }
        
        if meu == 2 && pc == 1 {
            pontosJogador = pontosJogador + 1
        }
        
        if meu == 2 && pc == 3 {
            pontosPc = pontosPc + 1
        }
        
        if meu == 3 && pc == 1 {
            pontosPc = pontosPc + 1
        }
        
        if meu == 3 && pc == 2 {
            pontosJogador = pontosJogador + 1
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
