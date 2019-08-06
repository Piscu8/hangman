require "spec_helper.rb"

module Hangman
  describe Generador do
    let(:subject) { described_class.new}

    context "#initialize" do
      it "is initialize with a random value by default" do
        # palabra = Generador.new
        expect(subject.value).not_to eq ''
      end
    end

  end  
end