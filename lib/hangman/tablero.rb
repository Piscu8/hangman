module Hangman
  class Tablero
    attr_accessor :palabra_a_adivinar, :palabras_ya_elegidas
    def initialize
      @palabras_ya_elegidas = []
    end
    
    def crea_tablero(largo)
      @palabra_a_adivinar = Array.new(largo, "-")
    end

    def dibuja_tablero
      palabra_a_adivinar.join("")
    end
      
    def agrega_letra(posiciones, letra)
      posiciones.each do |idx|
        palabra_a_adivinar[idx] = letra
      end      
    end

    def agrega_letra_inexistente(letra)
      palabras_ya_elegidas << letra
    end
    
  end    
end