class OrderList < ActiveRecord::Base

	def self.getlist

=begin
		ActiveRecord::Base.establish_connection :sqlserver

		ms_sql = ActiveRecord::Base

		@results = ms_sql.connection.select_all("SELECT _Number, DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time FROM _Document302 WHERE (_number = 'Э0000008434' OR _number = 'Э0000008435' OR _number = 'Э0000008436' OR _number = 'Э0000009036') AND _Date_Time > '4018-01-01 00:00:00' ").to_hash

		return @results
=end

@client = TinyTds::Client.new username: 'sa', password: 'cnfywbzvbh!1', host: '176.101.221.249', port: '15777', database: 'Megabyte'
#@results = @client.execute("SELECT _Number, DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time FROM _Document183 WHERE _Date_Time > '4018-01-01 00:00:00' ")

@results = @client.execute("SELECT     DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time, Megabyte.dbo._Document183._Number, Megabyte.dbo._Enum13249._EnumOrder AS Status,
                      Megabyte.dbo._Reference120._Description AS Master, _Reference120_1._Description AS Manager, Megabyte.dbo._Document183._Fld3165 AS Summa
FROM         Megabyte.dbo._Document183 LEFT OUTER JOIN
                      Megabyte.dbo._Reference120 ON Megabyte.dbo._Document183._Fld13241RRef = Megabyte.dbo._Reference120._IDRRef LEFT OUTER JOIN
                      Megabyte.dbo._Enum13249 ON Megabyte.dbo._Document183._Fld13250RRef = Megabyte.dbo._Enum13249._IDRRef LEFT OUTER JOIN
                      Megabyte.dbo._Reference120 AS _Reference120_1 ON Megabyte.dbo._Document183._Fld13248RRef = _Reference120_1._IDRRef
WHERE     (Megabyte.dbo._Document183._Date_Time > CONVERT(DATETIME, '4018-01-01 00:00:00', 102))")

@result = @results.each
@client.close
return @result

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