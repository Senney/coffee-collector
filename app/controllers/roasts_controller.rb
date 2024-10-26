class RoastsController < ApplicationController
  def index
    @roasts = Current.user.roasts.all
  end
end
