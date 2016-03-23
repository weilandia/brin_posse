class PairingSessionsController < ApplicationController
  before_action :set_pairing_session, only: [:show, :edit, :update, :destroy]

  # GET /pairing_sessions
  # GET /pairing_sessions.json
  def index
    @pairing_sessions = PairingSession.all
  end

  # GET /pairing_sessions/1
  # GET /pairing_sessions/1.json
  def show
  end

  # GET /pairing_sessions/new
  def new
    @pairing_session = PairingSession.new
  end

  # GET /pairing_sessions/1/edit
  def edit
  end

  # POST /pairing_sessions
  # POST /pairing_sessions.json
  def create
    @pairing_session = PairingSession.new(pairing_session_params)

    respond_to do |format|
      if @pairing_session.save
        format.html { redirect_to @pairing_session, notice: 'Pairing session was successfully created.' }
        format.json { render :show, status: :created, location: @pairing_session }
      else
        format.html { render :new }
        format.json { render json: @pairing_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pairing_sessions/1
  # PATCH/PUT /pairing_sessions/1.json
  def update
    respond_to do |format|
      if @pairing_session.update(pairing_session_params)
        format.html { redirect_to @pairing_session, notice: 'Pairing session was successfully updated.' }
        format.json { render :show, status: :ok, location: @pairing_session }
      else
        format.html { render :edit }
        format.json { render json: @pairing_session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pairing_sessions/1
  # DELETE /pairing_sessions/1.json
  def destroy
    @pairing_session.destroy
    respond_to do |format|
      format.html { redirect_to pairing_sessions_url, notice: 'Pairing session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pairing_session
      @pairing_session = PairingSession.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pairing_session_params
      params.require(:pairing_session).permit(:complete)
    end
end
