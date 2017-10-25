class TasksController < ApplicationController


def home
  currentLocation = "#{params["currentLoc"]["lat"]},#{params["currentLoc"]["lng"]}"

  token = params["token"]

  decoded_token = JWT.decode(token, "helloDavid", true, { :algorithm => 'HS256' })

  if decoded_token[0]["charity_id"]
    json = {}
    json["charity?"] = decoded_token[0]["charity_id"] ? true : false
    json['task'] = Charity.find(decoded_token[0]["charity_id"]).tasks
  else
    allDistances = Task.all.collect do |task|
        "#{task.lat},#{task.lng}"
      end.join("|")
    url = "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=" + "#{currentLocation}" + "&destinations=" + "#{allDistances}" + "&key="
    response = RestClient.get(url)
    json = JSON.parse(response)
    @tasks = Task.all
    json['task'] = @tasks
  end

  render json: json
end

def create
  token = params["token"]

  decoded_token = JWT.decode(token, "helloDavid", true, { :algorithm => 'HS256' })

  @task = Task.create(charity_id: decoded_token[0]["charity_id"], title: params["title"], description: params["description"], address: params["description"], category: params["category"], date: params["date"], lat: params["lat"], lng:  params["lng"], max_people: params["max_people"])
  render json: @task
end

end
