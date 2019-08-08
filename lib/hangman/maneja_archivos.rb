module Hangman
  require "yaml"

class Archivo

  def serializa_archivo(tablero, palabra)
    file = File.open("./save/saved_game.yaml", "w")
    file.puts YAML::dump(tablero)
    file.puts ""
    file.puts YAML::dump(palabra)
    file.puts ""
  end

  def deserializa_archivo
    array = []
    $/="\n\n"
    File.open("./save/saved_game.yaml", "r").each do |object|
      array << YAML::load(object)
    end
    return array
  end
end
end