class StandartCalculator < CreditCalculator
  attr_reader :payment, :month_percent, :all_payment, :credit

  def calculate
    @month_percent = []
    @all_payment = []
    @payment = [@credit.first / @term]

    @term.times do
      @month_percent << @credit.last * 30 * @percent / 36_000
      @all_payment << @payment.last + @month_percent.last
      @credit << @credit.last - @payment.last
    end
  end
end
