def credit_card_checker(credit_card_number)
  clean_number = credit_card_number.gsub(/\s+/, '')
  regexp = /(\d)\d{15}/

  if clean_number.match(regexp) && clean_number.match(regexp)[1] == '4' && luhn_validator(clean_number)
    'Valid Visa credit card number'
  elsif clean_number.match(regexp) && clean_number.match(regexp)[1] == '5' && luhn_validator(clean_number)
    'Valid Mastercard credit card number'
  else
    'Invalid credit card number'
  end
end


def luhn_validator(card_number)
  card_number.chars.map(&:to_i).map.with_index do |num, index|
    if index.even?
      (num * 2) % 9
    else
      num
    end
  end.sum % 10 == 0
end
