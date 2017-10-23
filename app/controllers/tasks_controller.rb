class TasksController < ApplicationController


def home
  task = Task.first
  currentLocation = "#{params["lat"]},#{params["lng"]}"
  @tasks = Task.all
  allDistances = Task.all.collect do |task|
      "#{task.lat},#{task.lng}"
    end.join("|")
  url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" + "#{currentLocation}" + "&destinations=" + "#{allDistances}" + "&key="
  response = RestClient.get(url)
  json = JSON.parse(response)
  json['task'] = @tasks
  render json: json
end

end
