class WebhookController < ApplicationController
  def submit
    speech = "API is working"

    msg = {
      "speech": speech,
      "displayText": speech,
      "source": "tdrs-bot"
    }

    respond_to do |format|

      format.json { render json: msg }
    end
  end
end
