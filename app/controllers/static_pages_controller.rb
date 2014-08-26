class StaticPagesController < ApplicationController
  def index
    @card = Card.where("review_date < ?", Date.today).take
  end
end
