class DailyReportsController < ApplicationController
  before_action :set_daily_report, only: [:edit, :update, :destroy]

  # GET /daily_reports
  # GET /daily_reports.json
  def index
    @daily_reports = DailyReport.all
  end

  # GET /daily_reports/1
  # GET /daily_reports/1.json
  def show
    @country1 = params[:c1]
    @reports = DailyReport.where(:country => @country1).group(:country).group(:day).order(day: :desc)
  end

  # GET /daily_reports/new
  def new
    @daily_report = DailyReport.new
  end

  # GET /daily_reports/1/edit
  def edit
  end

  # GET /daily_reports/compare?c1=Brazil&c2=Italy
  def compare

    @avaialble_countries = DailyReport.select(:country).distinct(:country).order(:country)

    @reference = 1000000
    @country1 = params[:c1].presence || "Brazil"
    @country2 = params[:c2] || "Italy"
    @country1_first_confirmed = DailyReport.where(:country => @country1).where('confirmed > 0').order(:day).first
    @country2_first_confirmed = DailyReport.where(:country => @country2).where('confirmed > 0').order(:day).first
    @country1_first_death = DailyReport.where(:country => @country1).where('deaths > 0').order(:day).first
    @country2_first_death = DailyReport.where(:country => @country2).where('deaths > 0').order(:day).first
    @country1_7_days_death = DailyReport.new
    # @country1_7_days_death = DailyReport
    #                              .where(:country => @country1)
    #                              .sum(:confirmed)
    #                              .select(:confirmed).where(:day => @country1_first_confirmed.day + 7).group(:country).group(:day).first
    # @country2_7_days_death = DailyReport.where(:country => @country2).where(:day => @country2_first_confirmed.day + 7).group(:country).group(:day).first
    # @country1_14_days_death = DailyReport.where(:country => @country1).where(:day => @country1_first_confirmed.day + 14).group(:country).group(:day).first
    # @country2_14_days_death = DailyReport.where(:country => @country2).where(:day => @country2_first_confirmed.day + 14).group(:country).group(:day).first
    # @country1_21_days_death = DailyReport.where(:country => @country1).where(:day => @country1_first_confirmed.day + 21).group(:country).group(:day).first
    # @country2_21_days_death = DailyReport.where(:country => @country2).where(:day => @country2_first_confirmed.day + 21).group(:country).group(:day).first
    # @country1_30_days_death = DailyReport.where(:country => @country1).where(:day => @country1_first_confirmed.day + 30).group(:country).group(:day).first
    # @country2_30_days_death = DailyReport.where(:country => @country2).where(:day => @country2_first_confirmed.day + 30).group(:country).group(:day).first
    # @country1_last = DailyReport.where(:country => @country1).group(:country).group(:day).order(:day).last
    # @country2_last = DailyReport.where(:country => @country2).group(:country).group(:day).order(:day).last
    @country2_7_days_death =  DailyReport.new
    @country1_14_days_death = DailyReport.new
    @country2_14_days_death = DailyReport.new
    @country1_21_days_death = DailyReport.new
    @country2_21_days_death = DailyReport.new
    @country1_30_days_death = DailyReport.new
    @country2_30_days_death = DailyReport.new
    @country1_last = DailyReport.new
    @country2_last = DailyReport.new
    @country1_population = Population.where(:country => @country1).first
    @country2_population = Population.where(:country => @country2).first

  end

  # POST /daily_reports
  # POST /daily_reports.json
  def create
    @daily_report = DailyReport.new(daily_report_params)

    respond_to do |format|
      if @daily_report.save
        format.html { redirect_to @daily_report, notice: 'Daily report was successfully created.' }
        format.json { render :show, status: :created, location: @daily_report }
      else
        format.html { render :new }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /daily_reports/1
  # PATCH/PUT /daily_reports/1.json
  def update
    respond_to do |format|
      if @daily_report.update(daily_report_params)
        format.html { redirect_to @daily_report, notice: 'Daily report was successfully updated.' }
        format.json { render :show, status: :ok, location: @daily_report }
      else
        format.html { render :edit }
        format.json { render json: @daily_report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /daily_reports/1
  # DELETE /daily_reports/1.json
  def destroy
    @daily_report.destroy
    respond_to do |format|
      format.html { redirect_to daily_reports_url, notice: 'Daily report was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_daily_report
      @daily_report = DailyReport.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def daily_report_params
      params.require(:daily_report).permit(:country, :day, :confirmed, :deaths, :recovery)
    end
end
