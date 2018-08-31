class OrderList

    def self.getlist(user_id, from_date, to_date)
		
		byebug

        from_date = DateTime.now.prev_month(-1).to_s if from_date==nil
        to_date = DateTime.now.to_s if to_date==nil

		conf_connection = ActiveRecord::Base.connection_config
		
		ActiveRecord::Base.establish_connection :sqlserver

		@results = ActiveRecord::Base.connection.select_all("SELECT convert(varchar(32), Megabyte.dbo._Document183._IDRRef,2) AS _IDRRef, DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time, rtrim(Megabyte.dbo._Document183._Number) AS _Number, Megabyte.dbo._Enum13249._EnumOrder AS Status,
						      Megabyte.dbo._Reference120._Description AS Master, _Reference120_1._Description AS Manager, Megabyte.dbo._Document183._Fld3165 AS Summa
							  FROM         Megabyte.dbo._Document183
							  INNER JOIN Megabyte.dbo._Reference14726 ON (Megabyte.dbo._Document183._Fld3155RRef = Megabyte.dbo._Reference14726._Fld14731RRef AND Megabyte.dbo._Reference14726._Fld14727 = '#{user_id}')
							  LEFT OUTER JOIN Megabyte.dbo._Reference120 ON Megabyte.dbo._Document183._Fld13241RRef = Megabyte.dbo._Reference120._IDRRef
							  LEFT OUTER JOIN Megabyte.dbo._Enum13249 ON Megabyte.dbo._Document183._Fld13250RRef = Megabyte.dbo._Enum13249._IDRRef
							  LEFT OUTER JOIN Megabyte.dbo._Reference120 AS _Reference120_1 ON Megabyte.dbo._Document183._Fld13248RRef = _Reference120_1._IDRRef
								 WHERE (Megabyte.dbo._Document183._Date_Time >= CONVERT(DATETIME, '#{Date.parse(from_date).prev_year(-2000).strftime("%Y-%m-%d")}', 102)
								   AND Megabyte.dbo._Document183._Date_Time <= CONVERT(DATETIME, '#{Date.parse(to_date).prev_year(-2000).strftime("%Y-%m-%d")}', 102)
								   AND Megabyte.dbo._Document183._Fld3165 > 0
								   AND Megabyte.dbo._Document183._Posted = 1)
								ORDER BY DATEADD(YEAR, -2000, _Date_Time)").to_hash

		ActiveRecord::Base.establish_connection conf_connection
		
		return @results

	end


	def self.getdetails_usl(order_UIN)

		conf_connection = ActiveRecord::Base.connection_config
		
		ActiveRecord::Base.establish_connection :sqlserver

		@results = ActiveRecord::Base.connection.select_all("Select Megabyte.dbo._Document183_VT3209._Fld3211 AS Descr, Megabyte.dbo._Document183_VT3209._Fld3212 AS Kol, Megabyte.dbo._Document183_VT3209._Fld3214 AS Summa, Megabyte.dbo._Document183._Number from Megabyte.dbo._Document183_VT3209
								Inner Join Megabyte.dbo._Document183 ON Megabyte.dbo._Document183._IDRRef = Megabyte.dbo._Document183_VT3209._Document183_IDRRef
								WHERE convert(varchar(32), Megabyte.dbo._Document183_VT3209._Document183_IDRRef,2) = '#{order_UIN}'").to_hash

		ActiveRecord::Base.establish_connection conf_connection
		#byebug
		return @results

	end

	def self.getdetails_tov(order_UIN)

		conf_connection = ActiveRecord::Base.connection_config
		
		ActiveRecord::Base.establish_connection :sqlserver

		@results = ActiveRecord::Base.connection.select_all("select Megabyte.dbo._Reference84._Description AS Descr, Megabyte.dbo._Document183_VT3178._Fld3182 AS Kol, Megabyte.dbo._Document183_VT3178._Fld3190 AS Summa, Megabyte.dbo._Document183._Number from Megabyte.dbo._Document183_VT3178
							inner join Megabyte.dbo._Document183 ON Megabyte.dbo._Document183._IDRRef = Megabyte.dbo._Document183_VT3178._Document183_IDRRef
							inner join Megabyte.dbo._Reference84 ON Megabyte.dbo._Document183_VT3178._Fld3185RRef = Megabyte.dbo._Reference84._IDRRef
							WHERE convert(varchar(32), Megabyte.dbo._Document183_VT3178._Document183_IDRRef,2) = '#{order_UIN}'").to_hash

		ActiveRecord::Base.establish_connection conf_connection
		#byebug
		return @results

	end

  	def self.getstatus(order_number)

        conf_connection = ActiveRecord::Base.connection_config
       
        ActiveRecord::Base.establish_connection :sqlserver

        results = ActiveRecord::Base.connection.select_all("SELECT TOP (1) DATEADD(YEAR, - 2000, Megabyte.dbo._Document183._Date_Time) AS _Date_Time, Megabyte.dbo._Document183._Number,
                          Megabyte.dbo._Enum13249._EnumOrder
                        FROM Megabyte.dbo._Document183 LEFT OUTER JOIN
                          Megabyte.dbo._Enum13249 ON Megabyte.dbo._Document183._Fld13250RRef = Megabyte.dbo._Enum13249._IDRRef
                        WHERE     (Megabyte.dbo._Document183._Number LIKE '#{order_number}%')
                        ORDER BY _Date_Time DESC").to_hash

        ActiveRecord::Base.establish_connection conf_connection
        
        #byebug
        if results[0] == nil
        	return "Заказ не найден";
        else
        	return description_status(results[0]["_EnumOrder"])
        end

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