class StaticPagesController < ApplicationController
  def index
    @cards = Card.new_review
  end
end
