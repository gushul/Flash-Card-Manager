class StaticPagesController < ApplicationController
  def index
    @card = Card.review_before
  end
end
