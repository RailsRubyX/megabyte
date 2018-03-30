class OrderList

	def self.getlist(user_id)

		conf_connection = ActiveRecord::Base.connection_config
		#byebug
		ActiveRecord::Base.establish_connection :sqlserver

		@results = ActiveRecord::Base.connection.select_all("SELECT     DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time, rtrim(Megabyte.dbo._Document183._Number) AS _Number, Megabyte.dbo._Enum13249._EnumOrder AS Status,
						      Megabyte.dbo._Reference120._Description AS Master, _Reference120_1._Description AS Manager, Megabyte.dbo._Document183._Fld3165 AS Summa
							  FROM         Megabyte.dbo._Document183
							  INNER JOIN Megabyte.dbo._Reference14726 ON (Megabyte.dbo._Document183._Fld3155RRef = Megabyte.dbo._Reference14726._Fld14731RRef AND Megabyte.dbo._Reference14726._Fld14727 = '#{user_id}')
							  LEFT OUTER JOIN Megabyte.dbo._Reference120 ON Megabyte.dbo._Document183._Fld13241RRef = Megabyte.dbo._Reference120._IDRRef
							  LEFT OUTER JOIN Megabyte.dbo._Enum13249 ON Megabyte.dbo._Document183._Fld13250RRef = Megabyte.dbo._Enum13249._IDRRef
							  LEFT OUTER JOIN Megabyte.dbo._Reference120 AS _Reference120_1 ON Megabyte.dbo._Document183._Fld13248RRef = _Reference120_1._IDRRef
								WHERE (Megabyte.dbo._Document183._Date_Time > CONVERT(DATETIME, '#{DateTime.now.prev_year(-1999).strftime("%Y-%m-%d")}', 102)
								   AND Megabyte.dbo._Document183._Fld3165 > 0
								   AND Megabyte.dbo._Document183._Posted = 1)
								ORDER BY DATEADD(YEAR, -2000, _Date_Time)").to_hash

		ActiveRecord::Base.establish_connection conf_connection

		return @results

	end


	def self.getdetails_usl(order_number)

		conf_connection = ActiveRecord::Base.connection_config
		#byebug
		ActiveRecord::Base.establish_connection :sqlserver

		@results = ActiveRecord::Base.connection.select_all("Select Megabyte.dbo._Document183_VT3209._Fld3211 AS Descr, Megabyte.dbo._Document183_VT3209._Fld3212 AS Kol, Megabyte.dbo._Document183_VT3209._Fld3214 AS Summa, Megabyte.dbo._Document183._Number from Megabyte.dbo._Document183_VT3209
								Inner Join Megabyte.dbo._Document183 ON Megabyte.dbo._Document183._IDRRef = Megabyte.dbo._Document183_VT3209._Document183_IDRRef
								WHERE Megabyte.dbo._Document183._Number LIKE '#{order_number}%'").to_hash

		ActiveRecord::Base.establish_connection conf_connection

		return @results

	end

	def self.getdetails_tov(order_number)

		conf_connection = ActiveRecord::Base.connection_config
		#byebug
		ActiveRecord::Base.establish_connection :sqlserver

		@results = ActiveRecord::Base.connection.select_all("select Megabyte.dbo._Reference84._Description AS Descr, Megabyte.dbo._Document183_VT3178._Fld3182 AS Kol, Megabyte.dbo._Document183_VT3178._Fld3190 AS Summa, Megabyte.dbo._Document183._Number from Megabyte.dbo._Document183_VT3178
							inner join Megabyte.dbo._Document183 ON Megabyte.dbo._Document183._IDRRef = Megabyte.dbo._Document183_VT3178._Document183_IDRRef
							inner join Megabyte.dbo._Reference84 ON Megabyte.dbo._Document183_VT3178._Fld3185RRef = Megabyte.dbo._Reference84._IDRRef
							WHERE Megabyte.dbo._Document183._Number LIKE '#{order_number}%'").to_hash

		ActiveRecord::Base.establish_connection conf_connection

		return @results

	end

	def self.description_status(orderstarus)

		case orderstarus
		when 0
			"Нет"
		when 1
			"Принято в работу"
		when 2
			"У субподрядчика"
		when 3
			"Согласовать"
		when 4
			"Ожидает решения"
		when 5
			"Обработать"
		when 6
			"Ожидает поставки"
		when 7
			"Выполняется"
		when 8
			"Уведомить"
		when 9
			"Готово"
		when 10
			"Доставить"
		when 11
			"У курьера"
		when 12
			"Отдано клиенту"
		end
		
	end


end