//
//  GameScene.swift
//  FisicaAplicadaEmObjetosMovimentando
//
//  Created by Pedro Henrique Dias Hemmel de Oliveira Souza on 09/11/22.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    //Criando os nodes da bola e do retangulo que estará em volta
    let jogador = SKShapeNode(circleOfRadius: 15)
    let areaRetangular = SKShapeNode(rectOf: CGSize(width: 500, height: 30))
    
    //Criando os nodes da borda do jogo
    private var bottomBorder = SKShapeNode()
    private var topBorder = SKShapeNode()
    private var leftBorder = SKShapeNode()
    private var rightBorder = SKShapeNode()
    
    //Criando as variáveis que detectarãoos toques do usuário para gerar o impulso na bolinha
    private var pontoInicial = CGPoint()
    private var pontoFinal = CGPoint()
    
    override func didMove(to view: SKView) {
        
        self.backgroundColor = .orange
        
        //Aplicando propriedades visuais e funcionais para a bolinha
        self.jogador.strokeColor = .black
        self.jogador.fillColor = .black
        self.jogador.physicsBody = SKPhysicsBody(circleOfRadius: 15)
        self.jogador.physicsBody?.affectedByGravity = true
        self.jogador.physicsBody?.isDynamic = true
        self.jogador.position = CGPoint(x: 0, y: 100)
        
        //Aplicando propriedades visuais para o retângulo
        self.areaRetangular.strokeColor = .brown
        self.areaRetangular.fillColor = .brown
        self.areaRetangular.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 500, height: 30))
        self.areaRetangular.physicsBody?.affectedByGravity = false
        self.areaRetangular.physicsBody?.isDynamic = false
        self.areaRetangular.position = .init(x: 0, y: -frame.height / 4)
        
        //Aplicando propriedades de tamanho e posição de cada borda criada
        self.bottomBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 1))
        self.bottomBorder.physicsBody?.affectedByGravity = false
        self.bottomBorder.physicsBody?.isDynamic = false
        self.bottomBorder.position = .init(x: 0, y: -frame.height / 2)
        
        self.topBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: frame.width, height: 1))
        self.topBorder.physicsBody?.affectedByGravity = false
        self.topBorder.physicsBody?.isDynamic = false
        self.topBorder.position = .init(x: 0, y: frame.height / 2)
        
        self.leftBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: frame.height))
        self.leftBorder.physicsBody?.affectedByGravity = false
        self.leftBorder.physicsBody?.isDynamic = false
        self.leftBorder.position = .init(x: -frame.width / 2, y: 0)
        
        self.rightBorder.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 1, height: frame.height))
        self.rightBorder.physicsBody?.affectedByGravity = false
        self.rightBorder.physicsBody?.isDynamic = false
        self.rightBorder.position = .init(x: frame.width / 2, y: 0)
        
        //Adicionando um enquadramento melhor para que o jogo seja melhor mostrado
        let camera = SKCameraNode()
        camera.setScale(1.5)
        
        //Adicionando os nodes criados à cena
        self.addChild(self.jogador)
        self.addChild(self.areaRetangular)
        self.addChild(self.bottomBorder)
        self.addChild(self.topBorder)
        self.addChild(self.leftBorder)
        self.addChild(self.rightBorder)
        self.addChild(camera)
        
        scene?.camera = camera
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        //Identificando e guardando a posição do primeiro toque do usuário
        for touch in touches {
            self.pontoInicial = touch.location(in: self)
        }
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        //Identificando e guardando a posição do último toque do usuário
        for touch in touches {
            self.pontoFinal = touch.location(in: self)
        }
        
        //Aplicando impulso imposto pela usuário com base no ponto do toque inicial e ponto do toque final
        self.jogador.physicsBody?.applyImpulse(CGVector(dx: self.pontoFinal.x - self.pontoInicial.x, dy: self.pontoFinal.y - pontoInicial.y))
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    
    override func update(_ currentTime: TimeInterval) {
    }
}
