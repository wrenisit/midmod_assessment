class SearchController < ApplicationController

  def index
    conn = Faraday.new('https://www.potterapi.com/v1/')
    # houses_response = conn.get("houses?key=#{mykey}")
    # houses_hash = JSON.parse(houses_response.body)
    # houses = Hash.new
    # houses_hash.map do |house_info|
    #   houses[house_info["name"]] = house_info["_id"]
    # end
    # search_house = houses[params[:house]]
     @house_name = params["house"]
    #
    # members_response = conn.get("houses/#{search_house}?key=#{mykey}")
    # members_parsed = JSON.parse(members_response.body)
    # members = members_parsed[0]["members"]
    # @order = []
    # members.each do |k,v|
    #
    #   studentresponse = conn.get("characters/#{k["id"]}?key=#{mykey}")
    #   student = JSON.parse(studentresponse.body)
    #   student.map do |student|
    #     if student["orderOfThePhoenix"] == true
    #       @order << student
    #     end
    #   end
    #   @order
    # end
    #just about to refactor to this:
    order_resp = conn.get("characters?orderOfThePhoenix=true&key=ENV[HP_KEY]")
    @order = JSON.parse(order_resp.body)[0]
  end
end
