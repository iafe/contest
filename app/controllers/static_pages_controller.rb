class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def rules
    @awards = Award.all
  end

  def contact
  end
  
end
