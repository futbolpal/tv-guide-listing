require 'spec_helper'

describe AiringsController, :type => :api do 


	it "should do something" do 
		get airings_path, {
			:api_key => "v39t8qd5fekwyavdnxxhrssm",
			:service_id => 62536,
			:source_id => 410,
			:format => "atom"
		} 
		byebug

	end

end
