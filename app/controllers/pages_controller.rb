class PagesController < ApplicationController
  before_action :authenticate_user! 
  def home
    @exercises = current_user.exercises
  end

  


end
