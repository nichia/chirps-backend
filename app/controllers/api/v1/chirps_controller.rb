class Api::V1::ChirpsController < ApplicationController
  
    # GET /chirps
    def index
      if params[:sort_by] == "t"
        # Recent/Top chirps: Order list of chirps by number of upvotes
        @chirps = Chirp.chirps_by_upvotes
      else
        # Recent/Top chirps: Order list of chirps by recency follow by number of upvotes
        @chirps = Chirp.chirps_by_latest_upvotes
      end
      # Order list of chirps by newest chirp at the top
      # @chirps = Chirp.chirps_all_latest
      
      render json: @chirps
    end

    # POST /chirps
    def create
      @chirp = Chirp.new(chirp_params)

      if @chirp.save
        ChirpNotifierJob.perform_later(@chirp.id)
        render json: @chirp, status: :created
      else
        render json: @chirp.errors, status: :not_acceptable
      end
    end

    private

    # Only allow a trusted parameter "white list" through.
    def chirp_params
      params.require(:chirp).permit(:text)
    end
end