class StaticPagesController < ApplicationController
  def index
    if current_user
      @card = current_user.cards.pending.take
    end
  end
end
