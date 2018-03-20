namespace :cron do
	desc 'Daily statistic, get new/total flowers, new sightings'
	task dailyJob: :environment do
		Flower.connection
		new_flowers = Flower.where(created_at: 24.hours.ago..Time.now).count
		total_flowers = Flower.where(updated_at: 24.hours.ago..Time.now).count
		new_sightings = Sighting.where(created_at: 24.hours.ago..Time.now).count

		d = DailyStatistic.create
		d.new_flowers = new_flowers
		d.total_flowers = total_flowers
		d.new_sightings = new_sightings
		d.save
	end
end