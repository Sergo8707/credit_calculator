class AnnuityCalculator < CreditCalculator
  attr_reader :payment, :month_percent, :all_payment, :credit

  def calculate
    @payment = []
    @month_percent = []
    percent_year = @percent / 100 / 12
    @all_payment = [@credit.first * (percent_year + (percent_year / ((1 + percent_year)**@term - 1)))]

    @term.times do
      @month_percent << @credit.last * percent_year
      @payment << @all_payment.last - @month_percent.last
      @credit << @credit.last - @payment.last
    end
  end
end
