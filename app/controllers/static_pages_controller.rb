class StaticPagesController < ApplicationController
  def home
    @awards = Award.all
  end

  def about
  end

  def contact
  end
  
  def instructions
  end
  
end
