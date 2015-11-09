class UsersCardsController < ApplicationController
  before_action :set_users_card, only: [:show, :edit, :update, :destroy]

  # GET /users_cards
  # GET /users_cards.json
  def index
    @users_cards = UsersCard.all
  end

  # GET /users_cards/1
  # GET /users_cards/1.json
  def show
  end

  # GET /users_cards/new
  def new
    @users_card = UsersCard.new
  end

  # GET /users_cards/1/edit
  def edit
  end

  # POST /users_cards
  # POST /users_cards.json
  def create
    @users_card = UsersCard.new(users_card_params)

    respond_to do |format|
      if @users_card.save
        format.html { redirect_to @users_card, notice: 'Users card was successfully created.' }
        format.json { render :show, status: :created, location: @users_card }
      else
        format.html { render :new }
        format.json { render json: @users_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users_cards/1
  # PATCH/PUT /users_cards/1.json
  def update
    respond_to do |format|
      if @users_card.update(users_card_params)
        format.html { redirect_to @users_card, notice: 'Users card was successfully updated.' }
        format.json { render :show, status: :ok, location: @users_card }
      else
        format.html { render :edit }
        format.json { render json: @users_card.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users_cards/1
  # DELETE /users_cards/1.json
  def destroy
    @users_card.destroy
    respond_to do |format|
      format.html { redirect_to users_cards_url, notice: 'Users card was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users_card
      @users_card = UsersCard.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def users_card_params
      params.require(:users_card).permit(:user_id, :card_id)
    end
end
