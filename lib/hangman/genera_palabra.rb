module Hangman
  class Generador
    attr_accessor :value

    def initialize
      @value = palabra_aleatoria
    end

    private

    def palabra_aleatoria
      file = File.readlines("5desk.txt")
      rnd = Random.new
      return file[rnd.rand(0..61406)].chomp.downcase
    end
  end
end