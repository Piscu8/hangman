module Hangman
    class Palabra
    
      attr_accessor :value

    def initialize(value = "")
      @value = value
    end

    def cant_letras
      return value.length 
    end

    def contiene_letra?(letra)
      value.include? letra
    end

    def posicion_letra(letra)
      posiciones = []
      value.split("").each_with_index { |let, idx| posiciones << idx if let == letra }
      return posiciones
    end

  end
end