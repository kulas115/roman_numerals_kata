class RomanNumeralConverter
  ROMAN_DIGITS = [
    ['M', 1000],
    ['CM', 900],
    ['D', 500],
    ['CD', 400],
    ['C', 100],
    ['XC', 90],
    ['L', 50],
    ['XL', 40],
    ['X', 10],
    ['IX', 9],
    ['V', 5],
    ['IV', 4],
    ['I', 1]
  ].freeze

  ROMAN_VALUES = {}
  ROMAN_DIGITS.each do |glyph, limit|
    ROMAN_VALUES[glyph] = limit
  end

  def convert(number)
    if number.is_a?(String)
      convert_to_arabic(number)
    else
      convert_to_roman(number)
    end
  end

  private

  def convert_to_arabic(number)
    if number =~ /^-/
      - convert_to_positive_arabic(number[1])
    else
      convert_to_positive_arabic(number)
    end
  end

  # rubocop:disable Metrics/MethodLength
  def convert_to_positive_arabic(number)
    sum = 0
    number.chars.each.with_index do |character, index|
      value = roman_value(character)
      next_value = roman_value(number[index + 1])
      if value < next_value
        sum -= roman_value(character)
      else
        sum += roman_value(character)
      end
    end
    sum
  end
  # rubocop:enable all

  def roman_value(character)
    ROMAN_VALUES[character] || 0
  end

  def convert_to_roman(number)
    if number.negative?
      '-' + convert_to_positive_roman(number[1])
    else
      convert_to_positive_roman(number)
    end
  end

  def convert_to_positive_roman(number)
    result = ''
    ROMAN_DIGITS.each do |glyph, limit|
      while number >= limit
        result << glyph
        number -= limit
      end
    end
    result
  end
end
