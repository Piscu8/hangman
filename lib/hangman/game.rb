module Hangman
  class Game
    attr_accessor :letra, :tablero, :palabra, :escogidas, :intentos
    
    def initialize (tablero=Tablero.new, palabra=Palabra.new(Generador.new.value))
      @tablero = tablero
      @palabra = palabra
      @escogidas = []
      @intentos = 5
    end

    def solicita_letra
      "Ingrese letra: "
    end

    def letra_ingresada(letra = gets.chomp)
      @letra = letra
    end

    def game_over?
      return true if @intentos == 0
      return true if palabra.value == tablero.dibuja_tablero
    end

    def msg_game_over
      plu = "La palabra era: #{palabra.value}!"
      if @intentos == 0 
        return "Ahorcado!\n" + plu
      elsif palabra.value == tablero.dibuja_tablero 
        return "Ha adivinado la palabra!\n" + plu
      end
    end
      

    def play
      tablero.crea_tablero(palabra.cant_letras)
      
      # puts palabra.value

      until game_over? do
        puts tablero.dibuja_tablero
        puts "Cantidad de intentos: #{@intentos}"
        puts "Letras ya elegidas: #{tablero.palabras_ya_elegidas.join(", ")}"
        print solicita_letra
        letra_escogida = letra_ingresada
        puts
        puts
        if palabra.contiene_letra?(letra_escogida)
          tablero.agrega_letra(palabra.posicion_letra(letra_escogida), letra_escogida)
        else
          tablero.agrega_letra_inexistente(letra_escogida)
          @intentos -= 1
        end
        
        puts "Desea salvar el juego? "
        res = gets.chomp
        if res == "s"
          p = Archivo.new
          p.serializa_archivo(tablero, palabra)
          puts "Partida salvada"
          break
        end

        puts msg_game_over

      end         
    
    end
  end
end
