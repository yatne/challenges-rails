class ChallengesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_challenge, only: %i[ show edit update destroy ]
  before_action :set_participant, only: %i[ show edit update destroy]

  # GET /challenges or /challenges.json
  def index
    @challenges = Challenge.left_joins(:participants).where(creator: current_user).or(Challenge.left_joins(:participants).where(participants: {id: current_user}))
  end

  # GET /challenges/1 or /challenges/1.json
  def show
    if @is_participant
      @is_creator = @challenge.creator == current_user
    else
      redirect_to challenges_path
    end
  end

  # GET /challenges/new
  def new
    @challenge = Challenge.new
  end

  # GET /challenges/1/edit
  def edit
    if @challenge.creator != current_user
      redirect_to challenge_url(@challenge)
    end
  end

  # POST /challenges or /challenges.json
  def create
    @challenge = Challenge.new(challenge_params)
    @challenge.creator = current_user
    @challenge.invite_token = SecureRandom.urlsafe_base64

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to challenge_url(@challenge), notice: "Challenge was successfully created." }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /challenges/1 or /challenges/1.json
  def update
    respond_to do |format|
      if current_user == @challenge.creator
        if @challenge.update(challenge_params)
          format.html { redirect_to challenge_url(@challenge), notice: "Challenge was successfully updated." }
          format.json { render :show, status: :ok, location: @challenge }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @challenge.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /challenges/1 or /challenges/1.json
  def destroy
    @challenge.destroy! if current_user == @challenge.creator

    respond_to do |format|
      format.html { redirect_to challenges_url, notice: "Challenge was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_challenge
      @challenge = Challenge.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def challenge_params
      params.require(:challenge).permit(:start_date, :end_date, :name, :description, :invite_token, :is_solo, creator: current_user)
    end

    def set_participant
      @is_participant = @challenge.all_participants.include?(current_user)
    end
end
