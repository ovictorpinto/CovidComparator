require 'csv'

namespace :covid do
  desc "Get data from github and fill population of countries"

  URL_CONFIRMED = 'https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/'
  DAY_OF_FIRST_REPORT = Date.new(2020, 1, 22)

  task filldata: :environment do

    Population.transaction do
      puts 'Cleaning population…'
      Population.delete_all
      puts "Cleaning population…[OK] #{Population.all.count} registros"
      puts 'Storing population…'
      get_population
      puts "Storing population…[ok] #{Population.all.count} registros"

      puts 'Cleaning reports…'
      DailyReport.delete_all
      puts "Cleaning reports…[OK] #{DailyReport.all.count} registros"
      puts 'Storing reports…'
      get_daily_reports
      puts "Storing reports…[ok] #{DailyReport.all.count} registros"
    end
  end

  private

  def get_population
    csv_text = File.read("db/Data_Extract_From_World_Development_Indicators/population_adjusted.csv")
    csv = CSV.parse(csv_text, :headers => true)
    csv.each do |row|
      pop = Population.new
      pop.country = row["Country Name"]
      pop.total = row["2018 [YR2018]"]
      pop.save
    end
  end

  def get_daily_reports
    day = DAY_OF_FIRST_REPORT
    while day != Date.today
      puts "gravando dados do dia #{day}"

      dailyUrl = "#{URL_CONFIRMED}#{day.strftime("%m-%d-%Y")}.csv"
      tempfile = Down.download(dailyUrl)
      FileUtils.mv(tempfile.path, "db/#{tempfile.original_filename}")
      csv_text = File.read("db/#{tempfile.original_filename}")
      csv = CSV.parse(csv_text, :headers => true)
      csv.each do |row|
        item = DailyReport.new
        item.confirmed = row["Confirmed"].presence || 0
        item.deaths = row["Deaths"].presence || 0
        item.recovery = row["Recovered"].presence || 0
        item.country = row["Country/Region"]
        if item.country.downcase.include? "china"
          item.country = "China"
        end
        item.day = day
        item.save
      end
      day = day + 1
    end
  end

end
