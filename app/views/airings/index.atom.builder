atom_feed do |feed|
	feed.title("My great blog!")
	feed.updated(@airings[0].AiringTime.to_time) if @airings.length > 0

	@airings.each do |airing|
byebug
		feed.entry(airing) do |entry|
			entry.title(airing.Title)
			entry.content(airing.Copy)
#			entry photo do |entry|
#				entry.link href: photo.file.url(:large), rel:"enclosure", type:"image/jpeg" 
#			end
		end
	end
end
