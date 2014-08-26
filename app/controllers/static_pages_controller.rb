class StaticPagesController < ApplicationController
  def index
    @card = Card.pending.take
  end
end
