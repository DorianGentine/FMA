class Solution < ApplicationRecord
  belongs_to :financer
  has_many :answers


  def set_conditions(arr_sep='&', key_sep=':')
    array = []
    if self.conditions.split("/,/").count > 1
      arrays = self.conditions.split(" /,/ ").map { |e| e.split(arr_sep)  }
      arrays.each do |e|
        array << set_a_condition(e, key_sep)
      end
    else
      a = self.conditions.split(arr_sep)
      array << set_a_condition(a, key_sep)
    end
    return array
  end

  def set_a_condition(e, key_sep)
    hash = {}
    e.each do |f|
      key_value = f.split(key_sep)
      value = key_value[1].gsub('[', '').gsub(']', '').split(',')
      if value.count == 1
        value = value.first.to_i.to_s == value.first ? value.first.to_i : value.first
      else
        value = value.map {|v| v.to_i.to_s == v ? v.to_i : v }
        # value = value.map(&:to_i)
      end
      # value.count == 1 ? value = value.first.to_i : value = value.map(&:to_i)
      hash[key_value[0].to_i] = value
    end
    return hash
  end

end


