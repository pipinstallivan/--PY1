money_capital=10000
salary = 5000
spend = 6000
increase = 0.05

def how_many_i_can_survive(base_cap,sal,inc,spnd):
    month = 0
    sum_1 = base_cap    
    while True:
        sum_1 -=spnd
        if sum_1 <0:
            break
        sum_1 +=sal
        spnd*=(1+inc)
        month+=1
    return month


print(how_many_i_can_survive(money_capital,salary,increase,spend))
