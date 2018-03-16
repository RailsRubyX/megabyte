class OrderList < ActiveRecord::Base

	def self.getlist

=begin
		ActiveRecord::Base.establish_connection :sqlserver

		ms_sql = ActiveRecord::Base

		@results = ms_sql.connection.select_all("SELECT _Number, DATEADD(YEAR, -2000, _Date_Time) AS _Date_Time FROM _Document302 WHERE (_number = 'Э0000008434' OR _number = 'Э0000008435' OR _number = 'Э0000008436' OR _number = 'Э0000009036') AND _Date_Time > '4018-01-01 00:00:00' ").to_hash

		return @results
=end


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