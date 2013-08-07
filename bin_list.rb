class Bank::BinList
  LIST ||= YAML.load_file('./bin_list.yml')

  class << self
    def detect(card_number)
      begin
        card_type = case card_number.chars.first
        when '4'
          'visa'
        when '5'
          'mastercard'
        end
        LIST["#{card_type.upcase}_#{card_number[0..1]}"].each{|(key, value)| return value if card_number.index(key.to_s) == 0}
        nil
      rescue
        nil
      end
    end
  end
end
