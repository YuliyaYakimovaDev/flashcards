class CardsController < ApplicationController

  def home
      @card = Card.random_card
  end

  def check
    @card = Card.find(params[:card_id])
    if @card.check_answer(params[:answer])
      redirect_to :back, notice: "Правильно!"
    else
      redirect_to :back, notice: "Неправильно!"
    end
  end

  def index
    @cards = Card.all
  end

  def new
    @card = Card.new
  end

  def edit
    @card = Card.find(params[:id])
  end

  def create
    @card = Card.new(card_params)

    if @card.save
      flash[:success] = "Card is created successfully!"
      redirect_to @card
    else
      render 'new'
    end
  end

  def show
    @card = Card.find(params[:id])
  end

  def update
    @card = Card.find(params[:id])
    if @card.update(card_params)
      redirect_to @card
    else
      render 'edit'
    end
  end

  def destroy
    @card = Card.find(params[:id])
    @card.destroy
    redirect_to cards_path
  end

  private

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end

end
