require 'spec_helper'
require_relative '../lib/agency'

describe Agency do
  it 'add license to movie' do
    subject.movie = 'Avatar'
    expect(subject.movie).to eq 'Avatar ©Walt Disney'
  end
  it 'add license to movie' do
    subject.book = 'Hobbit'
    expect(subject.book).to eq 'Hobbit ©Walt Disney'
  end

  describe 'block init' do
    subject do
      Agency.new do |o|
        o.movie = 'Avatar'
        o.book = 'Hobbit'
      end
    end

    it 'add license to movie' do
      expect(subject.movie).to eq 'Avatar ©Walt Disney'
    end

    it 'add license to book' do
      expect(subject.book).to eq 'Hobbit ©Walt Disney'
    end
  end

  describe '.licensed_items' do
    before :all do
      @obj = Agency.new
      @obj.licensed_items = {movie:'Avatar', book:'Hobbit'}
    end

    it 'add license to movie' do
      expect(@obj.movie).to eq 'Avatar ©Walt Disney'
    end

    it 'add license to book' do
      expect(@obj.book).to eq 'Hobbit ©Walt Disney'
    end
  end
end