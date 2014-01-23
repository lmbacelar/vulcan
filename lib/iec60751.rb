class Iec60751
  RESISTANCE_RANGE  = 18.5201..390.4811
  TEMPERATURE_RANGE = -200.000..850.000

  #
  # IEC 60751 R FUNCTION
  #
  def self.r t90, r0=100.0, a=3.9083e-03, b=-5.7750e-07, c=-4.1830e-12
    raise RangeError, 't90 is outside the valid range' unless TEMPERATURE_RANGE.include? t90
    self.r_unchecked t90, r0, a, b, c
  end

  #
  # R INVERSE FUNCTION COMPUTATION
  #
  MAX_ITERATIONS = 10
  MAX_ERROR      = 1e-4

  def self.t90 r, r0=100.0, a=3.9083e-03, b=-5.7750e-07, c=-4.1830e-12
    raise RangeError, 'r is outside the valid range' unless RESISTANCE_RANGE.include? r
    return 0 if r == r0
    t = t90_approximation r, r0, a, b, c
    MAX_ITERATIONS.times do
      slope = (r - r0) / t
      r_calc = r_unchecked t, r0, a, b, c
      break if (r_calc - r).abs < slope * MAX_ERROR
      t -= (r_calc - r) / slope
    end
    t
  end

private
  def self.r_unchecked t90, r0, a, b, c
    t90 >= 0 ?
      r0*(1 + a*t90 + b*t90**2) :
      r0*(1 + a*t90 + b*t90**2 - 100*c*t90**3 + c*t90**4)
  end

  def self.t90_approximation r, r0, a, b, c
    r >= r0 ?
      (-a + (a**2 - 4 * b * (1 - r / r0))**(0.5)) / (2 * b) :
      ((r / r0) - 1) / (a + 100 * b)
  end
end
