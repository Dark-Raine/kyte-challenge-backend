class KyteSearchController < ApplicationController
    def getflights
        response = Unirest.post "https://sandbox.api.gokyte.com/api/flights/search",
        headers:{
          "x-api-Key" => ENV["KYTE"],
          "Content-Type" => "application/json"
          # "Accept" => "application/json"
        },
        parameters:
        {
          "journeys": [
              {
                  "departureAirport": params[:departure],
                  "arrivalAirport": params[:arrival],
                  "departureDate": "2019-04-08",
                  "ticketTypes": [
                      "economy"
                  ]
              },
              {
                  "departureAirport": params[:arrival],
                  "arrivalAirport": params[:departure],
                  "departureDate": "2019-04-21",
                  "ticketTypes": [
                      "economy"
                  ]
              }
          ],
          "passengers": [
              {
                  "type": "adult"
              }
          ]
        }.to_json
          render json: response.body
        end
end
