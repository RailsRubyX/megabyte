class OrderList < ActiveRecord::Base

	def self.getlist

		ActiveRecord::Base.establish_connection :sqlserver

		ms_sql = ActiveRecord::Base

		@results = ms_sql.connection.select_all("SELECT _Number, DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time FROM _Document302 WHERE (_number = 'Э0000008434' OR _number = 'Э0000008435' OR _number = 'Э0000008436') AND _Date_Time > '4018-01-01 00:00:00' ").to_hash

		return @results
		
	end

end