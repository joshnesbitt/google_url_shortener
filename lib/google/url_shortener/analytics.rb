module Google
  module UrlShortener
    class Analytics
      PROJECTION_LEVEL = "FULL"
      attr_reader :raw, :all, :month, :week, :day, :two_hours
      
      class << self
        def from_hash(hash)
          a = new(hash)
          a.parse_all!
          a
        end
      end
      
      def initialize(raw={})
        @raw = raw.dup
      end
      
      def parse_all!
        @all   = AnalyticsGroup.from_hash(self.raw["allTime"])
        @month = AnalyticsGroup.from_hash(self.raw["month"])
        @week  = AnalyticsGroup.from_hash(self.raw["week"])
        @day   = AnalyticsGroup.from_hash(self.raw["day"])
        @two_hours = AnalyticsGroup.from_hash(self.raw["twoHours"])
      end
    end
  end
end
