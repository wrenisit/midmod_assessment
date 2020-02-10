class SearchController < ApplicationController
  def index
    conn = Faraday.new('https://www.potterapi.com/v1/')
    houses_response = conn.get(/houses?key="#{ENV['HP_KEY']}")
    
    binding.pry
  end

end
