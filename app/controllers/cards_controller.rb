class CardsController < ApplicationController
  before_action :set_card, only: [:show, :edit, :update, :destroy, :review]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def edit
  end
  
  def create
    @card = Card.new(card_params)

    if @card.save
      redirect_to @card, notice: 'Card was successfully created.'
    else
      render :new
    end
  end


  def update
    if @card.update(card_params)
      redirect_to @card, notice: 'Card was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @card.destroy
    redirect_to cards_path, notice: 'Card was successfully destroyed.'
  end

  def review
    if @card.check_translation(params[:translate])
      @card.update(review_date: :Date.today + 3)
      flash[:notice] = "Awesome! Try next card!"
    else
      flash[:alert] = "Wrong translate"
    end
    redirect_to root_path
  end

  private
  def set_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end
