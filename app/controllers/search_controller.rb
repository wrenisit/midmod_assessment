class SearchController < ApplicationController

  def index
    mykey = '$2a$10$Xlmp/Ne7Sk5kKfhVXGGu0OjIJ0ne6toxarurb6Zo0B9NzWy2Pwy6y'
    conn = Faraday.new('https://www.potterapi.com/v1/')
    houses_response = conn.get("houses?key=#{mykey}")
    houses_hash = JSON.parse(houses_response.body)
    houses = Hash.new
    houses_hash.map do |house_info|
      houses[house_info["name"]] = house_info["_id"]
    end
    search_house = houses[params[:house]]
    members_response = conn.get("houses/#{search_house}?key=#{mykey}")
    members_parsed = JSON.parse(members_response.body)
    members = members_parsed[0]["members"]
    @order = []
    members.each do |k,v|

      studentresponse = conn.get("characters/#{k["id"]}?key=#{mykey}")
      student = JSON.parse(studentresponse.body)
      student.map do |student|
        binding.pry
        if student[0]["orderOfThePhoenix"] == true
          @order << student[0]
        end
      end
      @order
    end
    binding.pry
  end

end
