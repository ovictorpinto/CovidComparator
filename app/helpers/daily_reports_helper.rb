module DailyReportsHelper

  # return @reference * @country1_last&.deaths / @country1_population&.total
  def per_indice(ref, hab, indice)
    if ref == nil || ref == 0 || hab == nil || hab == 0
      return " - "
    end
    return indice * ref / hab
  end
end
