
require File.expand_path('../../spec_helper', __FILE__)

describe MiniLisp::Parser do
 let(:parser) { MiniLisp::Parser.new }

  describe 'space' do
    subject { parser.space? }

    it { should parse('') }
    it { should parse(' ') }
    it { should parse("\n") }
    it { should parse("\t") }
    it { should parse(" \n\t \n") }
    it { should_not parse('x') }
    it { should_not parse(' x ') }
  end

  describe 'operators' do
    subject { parser.operator }

    it { should parse('+') }
    it { should parse('+ ') }
  end

  describe 'addition expression' do
    subject { parser.sum }

    it { should parse('1+2') }
    it { should parse('1 +2') }
  end
end
