require_relative "../lib/hangman.rb"
puts "Welcome to the hangman game"
print "Desea cargar partida salvada? "
res= gets.chomp
if res == "s"
  ju = []
  p = Hangman::Archivo.new
  ju = p.deserializa_archivo
  # puts ju[0].class
  # puts ju[1].class
  juego = Hangman::Game.new(ju[0], ju[1])
else
  juego = Hangman::Game.new
end

juego.play