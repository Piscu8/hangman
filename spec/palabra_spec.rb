require "spec_helper.rb"

module Hangman
    describe Palabra do
      
      context "#initialize" do
        it "is initialize with a value of '' by default" do
          palabra = Palabra.new
          expect(palabra.value).to eq ''
        end

        it "can be initialized with a word 'test'" do
          palabra = Palabra.new("test")
          expect(palabra.value).to eq "test"
        end

      end

      context "#cant_letras" do
        it "returns the number of characters of the word" do
          palabra = Palabra.new("test")
          expect(palabra.cant_letras).to eq 4
        end

        it "returns zero if word is ''" do
          palabra = Palabra.new
          expect(palabra.cant_letras).to eq 0
        end
      end

      context "#contiene_letra?" do
        it "returns true si contiene la letra" do
          palabra = Palabra.new("test")
          expect(palabra.contiene_letra?("e")).to be_truthy
        end

        it "returns false si no contiene la letra" do
          palabra = Palabra.new("test")
          expect(palabra.contiene_letra?("h")).to be_falsey
        end
      end

      context "#posicion_letra" do
        it "returns empty array si la palabra no contiene la letra especificada" do
          palabra = Palabra.new("test")
          expect(palabra.posicion_letra("h")).to eq []
        end

        it "returns array con un valor si solo está una sola vez la letra" do
          palabra = Palabra.new("test")
          expect(palabra.posicion_letra("e")).to eq [1]
        end

        it "returns array con multiples valores si la letra se encuentra varias veces" do
          palabra = Palabra.new("test")
          expect(palabra.posicion_letra("t")).to eq [0,3]
        end
      end


    end
end