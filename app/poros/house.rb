class House < ApplicationRecord
  attr_reader :name, :house_id
  def initialize(info)
    @name = info["name"]
    @house_id = info["_id"]
  end

end
