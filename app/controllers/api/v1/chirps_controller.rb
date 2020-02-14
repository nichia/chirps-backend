class Api::V1::ChirpsController < ApplicationController
  
    # GET /shirps
    def index
      @chirps = Chirp.all
      render json: @chirps
    end

end