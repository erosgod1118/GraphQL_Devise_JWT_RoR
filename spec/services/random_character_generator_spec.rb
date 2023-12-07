# /spec/services/random_character_generator_spec.rb
require 'rails_helper'

RSpec.describe RandomCharacterGenerator do
  
  describe "#new_character" do
    starting_database_count = Character.count

    rcg = RandomCharacterGenerator.new
    # let(:rcg) { RandomCharacterGenerator.new }
    let(:player) { Player.create(user_name: "Ronald McDonald", display_name: "Mac") }
    let(:character) {rcg.new_character("Ronnie the Rat", player)}
    let(:duplicate) { rcg.new_character("Ronnie the Rat", player) }

    context "success" do
      # it "creates a new Character instance" do
      #   expect(character).to be_an_instance_of Character
      # end

      it { expect(character).to be_an_instance_of Character }
    end
    
    context "failure (non-unique name)" do 
      it "returns a message that Character is not created" do
        expect(character).to be_an_instance_of Character
        expect(duplicate).to eq "Character not created -- name already exists!"
      end
    end

    it "randomly allocates all #{rcg.points_pool} stat points between #{rcg.stats_array.to_s}" do
      expect(rcg.stats_array.reduce(0) { |points, stat| points += character[stat] }).to eq rcg.points_pool
    end

    it "allocates stat points so stat values are between 1 and max roll (#{rcg.max_roll})" do
      expect(character.strength).to be_between(1, rcg.max_roll)
      expect(character.dexterity).to be_between(1, rcg.max_roll)
      expect(character.intelligence).to be_between(1, rcg.max_roll)
      expect(character.charisma).to be_between(1, rcg.max_roll)
    end

    it "saves the Character to the database" do
      expect(Character.count).to eq starting_database_count
    end
  end
end