class TasksController < ApplicationController


def home
  byebug
  task = Task.first
  url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" + "#{currentLocation.join(",")}" + "&destinations=" + "#{allDistance}" + "&key="
  response = RestClient.get(url)
  json = JSON.parse(response)

  render json: json
end

end
