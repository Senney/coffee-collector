require "securerandom"
require "uri"

class RoastsController < ApplicationController
  def index
    @roasts_grinding = Current.user.roasts.grinding.all
    @roasts_resting = Current.user.roasts.resting.all
  end

  def import_form
  end

  def import
    url = params[:url]
    job_id = SecureRandom.uuid

    if !valid_url?(url)
      flash[:error] = "Invalid URL"
      redirect_to import_roasts_path
      return
    end

    ExtractRoastFromUrlJob.perform_later(job_id, url, Current.user.id)

    redirect_to import_wait_roasts_path(job_id: job_id)
  end

  def import_wait
  end

  private

  def valid_url?(url)
    url =~ URI.regexp
  end
end
