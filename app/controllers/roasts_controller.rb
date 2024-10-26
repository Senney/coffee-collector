class RoastsController < ApplicationController
  def index
    @roasts_grinding = Current.user.roasts.grinding.all
    @roasts_resting = Current.user.roasts.resting.all
  end
end
