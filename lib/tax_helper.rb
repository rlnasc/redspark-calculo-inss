module TaxHelper
  def inss_tax_brackets
    # NOTE: primeiro numero é o piso da faixa, segundo é o teto
    {
      [0,       1045.00] => (7.50 / 100),    # 7,50%
      [1045.01, 2089.60] => (9.00 / 100),    # 9,00%
      [2089.61, 3134.40] => (12.00 / 100),   # 12,00%
      [3134.41, 6101.06] => (14.00 / 100),   # 14,00%
    }
  end
end

