require_relative "../lib/hangman.rb"
puts "Welcome to the hangman game"
juego = Hangman::Game.new
juego.play