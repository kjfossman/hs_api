class SessionsController < ApplicationController
  # before_action :set_session, only: [:show, :update, :destroy]

  # GET /sessions
  def index
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no user is logged in'
      }
    end
    # @sessions = Session.all

    # render json: {count: @sessions, status: logged_in? }
    # render json: { status: logged_in? }
  end

  # # GET /sessions/1
  # def show
  #   render json: @session
  # end

  # POST /sessions
  def create
    @user = User.find_by(email: session_params["email"])
    
    if @user
      login!
      render json: {
          status: :created, 
          logged_in: true, 
          user: @user
      }
      # render json: @session, status: :created, location: @session
    else
      render json: { status: 401 }
      # render json: @session.errors, status: :unprocessable_entity
    end
  end


  def is_logged_in?
  
    if logged_in? && current_user
      render json: {
        logged_in: true,
        user: current_user
      }
    else
      render json: {
        logged_in: false,
        message: 'no user is logged in'
      }
    end
end
  # PATCH/PUT /sessions/1
  # def update
  #   if @session.update(session_params)
  #     render json: @session
  #   else
  #     render json: @session.errors, status: :unprocessable_entity
  #   end
  # end

  # DELETE /sessions/1
  def destroy
    binding.pry
    @session.clear
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_session
    #   session = Session.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def session_params
      # params.fetch(:session, {})
      params.require(:user).permit(:name, :email)
    end
end
