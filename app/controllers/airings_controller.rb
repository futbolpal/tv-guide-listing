require 'open-uri'
require 'atom'

class AiringsController < ActionController::Base
	@@uri_prefix = "http://api.rovicorp.com/TVlistings/v9/listings/"
	@@service = "linearschedule/"

	# GET /airings.html
	# GET /airings.atom
	def index
		api_key = params[:api_key]
		service_id = params[:service_id]
		source_id = params[:source_id]

		j = JSON.parse(open("#{@@uri_prefix}#{@@service}#{service_id}/info?locale=en-US&sourceid=#{source_id}&inprogress=true&apikey=#{api_key}&sig=sig").read)
		@airings = j["LinearScheduleResult"]["Schedule"]["Airings"].map { |a| 
			o = Airing.new(a.symbolize_keys) 
		}
		feed = Atom::Feed.new do |f|
		  f.title = "Whats on #{@airings.first.SourceDisplayName}"
		  f.authors << Atom::Person.new(:name => 'Rovi')
		  f.updated = Time.now
		  @airings.each do |airing|
			  f.entries << Atom::Entry.new do |e|
				  e.title = airing.Title
				  e.updated = airing.AiringTime 
				  e.summary = airing.EpisodeTitle
				  e.content = Atom::Content::Html.new(airing.Copy) if airing.Copy
			  end
		  end
		end  
		respond_to do |format|
			format.atom { render :xml => feed.to_xml }
		end
	end
end
