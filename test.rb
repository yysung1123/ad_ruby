require_relative 'automatic_differentiation'

include SAD

# test diff (x + 1)^2 when x = 5
x = AD::var
one = AD::cons(1)
t = x.add(one).pow(2)
x.set_var(5)
puts t.diff
x.set_var(10)
puts t.diff

t1 = AD::cons(6)
t2 = AD::var
t7 = AD::cons(5)
# 6x^2 + x + 5
t8 = t1 * t2 ** 2 + t2 + t7
# when x = 2
t2.set_var(2)
puts t8.diff
# when x = 0
t2.set_var(0)
puts t8.diff
