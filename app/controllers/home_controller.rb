class HomeController < ApplicationController

  def search
    search_models = [User]
    @search_results = []
    search_models.each do |a_model|
      print '->' * 20
      print ' Model: ' + a_model.class.name
      puts @search_results.inspect
      @search_results += a_model.search_request(params[:search_for_this])
    end
    @search_results
  end

  def index
  end
end
