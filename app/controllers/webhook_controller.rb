class WebhookController < ApplicationController
  def submit
    #binding.pry
    speech = "Sorry, try to ask your question a different way"

    if params[:result][:action] == "how_much_house"
      speech = how_much_house
    end

    if params[:result][:action] == "how_much_vehicle"
      speech = how_much_vehicle
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

  def how_much_vehicle
    income = params[:result][:parameters][:income]

    "Dave recommends that the total cost of everything you own that goes down in value be less than half of your annual take home pay."
    "In your case, the total of stuff you own going down in value should be no more than $#{income.to_i/2}."
  end
end
