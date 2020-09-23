require './roman_numeral_converter'

# rubocop:disable Metrics/BlockLength
RSpec.describe RomanNumeralConverter do
  subject(:converter) { RomanNumeralConverter.new }

  TEST_CASES =
    [
      { arabic: 1, roman: 'I' },
      { arabic: 2, roman: 'II' },
      { arabic: 4, roman: 'IV' },
      { arabic: 6, roman: 'VI' },
      { arabic: 9, roman: 'IX' },
      { arabic: 10, roman: 'X' },
      { arabic: 20, roman: 'XX' },
      { arabic: 40, roman: 'XL' },
      { arabic: 50, roman: 'L' },
      { arabic: 90, roman: 'XC' },
      { arabic: 100, roman: 'C' },
      { arabic: 90, roman: 'XC' },
      { arabic: 400, roman: 'CD' },
      { arabic: 500, roman: 'D' },
      { arabic: 900, roman: 'CM' },
      { arabic: 1000, roman: 'M' },
      { arabic: 2013, roman: 'MMXIII' },
      { arabic: 3999, roman: 'MMMCMXCIX' },
      { arabic: -1, roman: '-I' },
      { arabic: 0, roman: '' }
    ].freeze

  context 'when converting from arabic to roman' do
    TEST_CASES.each do |assertion_pair|
      it { expect(converter.convert(assertion_pair[:arabic])).to eq(assertion_pair[:roman]) }
    end
  end

  context 'when converting from roman to arabic' do
    TEST_CASES.each do |assertion_pair|
      it { expect(converter.convert(assertion_pair[:roman])).to eq(assertion_pair[:arabic]) }
    end
  end
end
# rubocop:enable all
