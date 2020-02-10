class SearchController < ApplicationController

  def index
    mykey = '$2a$10$Xlmp/Ne7Sk5kKfhVXGGu0OjIJ0ne6toxarurb6Zo0B9NzWy2Pwy6y'
    conn = Faraday.new('https://www.potterapi.com/v1/')
    houses_response = conn.get("houses?key=#{mykey}")
    houses_hash = JSON.parse(houses_response.body)
    houses_hash.each do |house_info|
      House.create(house_info)
    end
    search_house = House.where(name: params[:house]).first
    binding.pry
  end

end
