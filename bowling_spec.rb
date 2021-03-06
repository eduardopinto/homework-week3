require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context 'Pins bound tests' do
    # ...
    it 'Negative number of pins' do
      expect(){
        bowling = Bowling.new
        bowling.roll -2
      }.to raise_error
    end

    it 'More than 10 pins' do
      expect(){
        bowling = Bowling.new
        bowling.roll 11
      }.to raise_error
    end

    it '10 pins' do
      bowling = Bowling.new
      bowling.roll 10
      score = bowling.score
      expect(score).to eq 10
    end

    it '0 pins' do
      bowling = Bowling.new
      bowling.roll 0
      score = bowling.score
      expect(score).to eq 0
    end

    it 'hit 8 and 4 pins' do
      expect(){
        bowling = Bowling.new
        example = [8,4]
        example.each do |roll|
          bowling.roll(roll)
        end
      }.to raise_error
    end
  end

  context 'Score tests' do
    # ...
    it 'Perfect game (300)' do
      bowling = Bowling.new
      for i in 0..11
        bowling.roll 10
      end
      score = bowling.score
      expect(score).to eq 300
    end

    it 'Homework3 example (133)' do
      bowling = Bowling.new
      example = [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 133
    end

    it 'Bonus Strike : 1 strike, hit 4 and 5 (28)' do
      bowling = Bowling.new
      example = [10,4,5]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 28
    end

    it 'Bonus Strike : 3 strikes a row (60)' do
      bowling = Bowling.new
      example = [10,10,10]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 60
    end

    it 'Bonus Spare : 1 spare, hit 4 and 5 (23)' do
      bowling = Bowling.new
      example = [5,5,4,5]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 23
    end

    it 'Bonus Spare : 1 spare, hit 0 and 5 (15)' do
      bowling = Bowling.new
      example = [5,5,0,5]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 15
    end

    it '10th play : Hit 2 and 6 and trys another roll (raise_error)' do
      expect(){
        bowling = Bowling.new
        example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,6,10]
        example.each do |roll|
          bowling.roll(roll)
        end
      }.to raise_error
    end

    it '10th play : Without bonus before, Strike 3 times (30)' do
      bowling = Bowling.new
      example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,10]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 30
    end

    it '10th play : Without bonus before, Strike 2 times and hit 5 (25)' do
      bowling = Bowling.new
      example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,10,5]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 25
    end

    it '10th play : Without bonus before, Strike 1 time, hit 5 and 3 (18)' do
      bowling = Bowling.new
      example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,5,3]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 18
    end

    it '10th play : Without bonus before, Spare 1 time and strike (30)' do
      bowling = Bowling.new
      example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,5,10]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 20
    end

    it '10th play : Striked before, hit 2 and 4 (22)' do
      bowling = Bowling.new
      example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,10,2,4]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 22
    end

    it '10th play : Spared before, hit 2 and 2 (16)' do
      bowling = Bowling.new
      example = [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,5,5,2,2]
      example.each do |roll|
        bowling.roll(roll)
      end
      score = bowling.score
      expect(score).to eq 16
    end

  end
end
