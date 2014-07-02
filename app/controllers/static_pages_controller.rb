class StaticPagesController < ApplicationController
  def home
    @awards = Award.all
    @award_deadline = Deadline.order("created_at").last
  end

  def about
  end

  def contact
  end
  
  def instructions
  end
  
end
