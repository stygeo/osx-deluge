#
#  ConnectionManager.rb
#  osx-deluge
#
#  Created by Jeffrey Wilcke on 6/11/11.
#  Copyright 2011 AP. All rights reserved.
#

class ConnectionManager
  def test_connection address, port, password
    params = {:method => "auth.login", :params => [password], :id => "3284"}
    response_string = RestClient.post "#{address}:#{port}/json", params.to_json, :content_type => :json, :accept => :json
    response = JSON.parse(response_string)
    
    response["result"]
  end
end
