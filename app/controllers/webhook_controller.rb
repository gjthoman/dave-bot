class WebhookController < ApplicationController
  def submit
    #binding.pry
    speech = "Sorry, try to ask your question a different way"

    if params[:result][:action] == "how_much_house"
      speech = how_much_house
    end

    msg = {
      "speech": speech,
      "displayText": speech,
      "source": "tdrs-bot"
    }

    respond_to do |format|

      format.json { render json: msg }
    end
  end

  def how_much_house
    amount = params[:result][:parameters][:amount]

    "Dave recommends your housing payment be less than one quarter of your take home pay. With an annual income of $#{amount}, you can safely spend up to $#{amount.to_i/12/4} per month on housing."
  end
end
