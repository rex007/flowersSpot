module Statistical
	extend ActiveSupport::Concern

	def self.create_statistic(record)
		Statistic.create! record_type: record.class.name, record_id: record.id
	end

end