class Airing 
	include ActiveModel::Model

	attr_accessor :ProgramId,:SeriesId,:InstanceId,:UnknownInstance,:UPId,:Title,:EpisodeTitle,:Copy
	attr_accessor :AiringTime,:Duration,:Color,:AiringType,:ShowingType,:CC,:LetterBox,:Stereo,:HD,:SAP
	attr_accessor :TVRating,:Dolby,:DSS,:HDLevel,:Sports,:DVS,:Category,:Subcategory,:SourceId,:Channel
	attr_accessor :CallLetters,:SourceDisplayName,:SourceLongName,:TiVoSupported,:ParentNetworkId
	attr_accessor :IconAvailable,:ServiceId,:DvbTriplet,:SL,:Subtitles
	alias_method :id, :ProgramId
end

