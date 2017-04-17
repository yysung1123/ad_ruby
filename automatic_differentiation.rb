module SAD
  class AD
    attr_accessor :val, :dval

    def initialize
      @val, @dval = lambda { return 0 }, lambda { return 0 }
    end

    def add(x)
      y = AD.new
      y.val, y.dval = lambda { return @val.call + x.val.call }, lambda { return @dval.call + x.dval.call }
      return y
    end

    def sub(x)
      y = AD.new
      y.val, y.dval = lambda { return @val.call - x.val.call }, lambda { @dval.call - x.dval.call }
      return y
    end

    def mul(x)
      y = AD.new
      y.val, y.dval = lambda { @val.call * x.val.call }, lambda { return @val.call * x.dval.call + @dval.call * x.val.call }
      return y
    end

    def div(x)
      y = AD.new
      return y
    end

    def pow(n)
      y = AD.new
      y.val, y.dval = lambda { return @val.call ** n }, lambda {  n * @val.call ** (n - 1) * @dval.call }
      return y
    end

    def sin
      y = AD.new
      y.val, y.dval = lambda { return Math::sin(@val.call) }, lambda { return Math::cos(@val.call) * @dval.call }
      return y
    end

    def cos
      y = AD.new
      y.val, y.dval = lambda { return Math::cos(@val.call) }, lambda { return -Math::sin(@val.call) * @dval.call }
      return y
    end

    def self.var
      y = AD.new
      y.dval = lambda { return 1 }
      return y
    end

    def self.cons(n)
      y = AD.new
      y.val = lambda { return n }
      return y
    end

    def set_var(n)
      @val = lambda { return n }
    end

    def diff
      return @dval.call
    end

    alias_method :+, :add
    alias_method :-, :sub
    alias_method :*, :mul
    alias_method :/, :div
    alias_method :**, :pow
  end
end
