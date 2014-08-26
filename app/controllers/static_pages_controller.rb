class StaticPagesController < ApplicationController
  def index
    @card = Card.review_before.take
  end
end
