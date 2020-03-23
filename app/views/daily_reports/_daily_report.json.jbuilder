json.extract! daily_report, :id, :country, :day, :confirmed, :deaths, :recovery, :created_at, :updated_at
json.url daily_report_url(daily_report, format: :json)
