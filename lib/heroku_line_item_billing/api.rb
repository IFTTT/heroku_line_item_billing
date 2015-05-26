module HerokuLineItemBilling
  module API
    def api
      @heroku ||= PlatformAPI.connect_oauth(ENV['HEROKU_API_TOKEN'])
    end
  end
end