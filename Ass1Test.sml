use ("Assi1.sml");
val is_older1 = is_older((2013, 12, 20), (2012,11,10)) = false
val is_older2 = is_older((2013, 12, 20), (2013,12,20)) = false
val is_older3 = is_older((2013, 12, 20), (2014,11,10)) = true
val number_in_month1 = number_in_month([(2013,12,1), (2013,1,1),(2013,3,1),(2013,4,1)], 2) = 0
val number_in_month2 = number_in_month([(2013,12,1), (2013,2,1),(2013,13,1),(2013,14,1)], 2) = 1
val number_in_month3 = number_in_month([], 2) = 0
val number_in_months1 = number_in_months([(2013,12,1), (2013,1,1),(2013,3,1),(2013,4,1)], [2, 3, 4]) = 2
val number_in_months2 = number_in_months([(2013,12,1), (2013,1,1),(2013,13,1),(2013,14,1)], [2, 3, 4]) = 0
val number_in_months3 = number_in_months([(2013,12,1), (2013,1,1),(2013,3,1),(2013,4,1)], []) = 0
val number_in_months4 = number_in_months([], [2, 3, 4]) = 0
val dates_in_month1 = dates_in_month([(2012,2,2), (2012,1,2)], 1) = [(2012,1,2)]
val dates_in_month2 = dates_in_month([(2012,1,2), (2012,2,2)], 1) = [(2012,1,2)]
val dates_in_month3 = dates_in_month([(2012,1,2), (2012,1,2)], 2) = []
val dates_in_month4 = dates_in_month([(2012,1,2), (2012,2,2), (2012,1,20), (2012,3,2)], 1) = [(2012,1,2),(2012,1,20)]
val dates_in_month5 = dates_in_month([], 1) = []
val dates_in_months1 = dates_in_months([(2012,2,2),(2012,1,2),(2012,1,12),(2012,3,2),(2012,2,2),(2012,3,2),(2012,2,2)], [1,5]) = [(2012,1,2), (2012,1,12)]
val dates_in_months2 = dates_in_months([(2012,5,2),(2012,4,2),(2012,1,12),(2012,3,2),(2012,2,2),(2012,3,2),(2012,2,2)], [1,5]) = [(2012,1,12), (2012,5,2)]
val dates_in_months3 = dates_in_months([(2012,5,2),(2012,4,2),(2012,1,12),(2012,3,2),(2012,2,2),(2012,3,2),(2012,2,2)], [7, 8, 9]) = []
val dates_in_months4 = dates_in_months([], [3,4,5,6]) = [] 
val dates_in_months5 = dates_in_months([(2012,5,2)], []) = []
val get_nth1 = get_nth(["a", "b", "c"], 2) = "b"
val date_to_string1 = date_to_string((1964, 3, 18)) = "March 18, 1964"
val number_before_reaching_sum1 = number_before_reaching_sum(8, [9,5,1,7,6,8,1,10]) = 0
val number_before_reaching_sum2 = number_before_reaching_sum(15, [9,5,1,7,6,8,1,10]) = 2
val number_before_reaching_sum3 = number_before_reaching_sum(30, [9,5,1,7,6,8,1,10]) = 5
val what_month1 = what_month(90) = 3
val what_month2 = what_month(50) = 2
val what_month3 = what_month(365) = 12
val month_range1 = month_range(28, 35) = [1, 1, 1, 1, 2, 2, 2, 2]
val oldest1 = oldest([(2013,12,1), (2012,1,1),(2011,3,1),(2010,4,1)]) = SOME (2010,4,1)
val oldest2 = oldest([(2013,12,1), (2012,1,1),(2011,3,1),(2014,4,1)]) = SOME (2011,3,1)
val oldest3 = oldest([(2013,12,1), (2012,1,1),(2015,3,1),(2014,4,1)]) = SOME (2012,1,1)
val number_in_months_ch1 = number_in_months_challenge([(2013,12,1), (2013,1,1),(2013,3,1),(2013,4,1)], [2, 3, 4, 3, 2]) = 2
val number_in_months_ch2 = number_in_months_challenge([(2013,12,1), (2013,1,1),(2013,13,1),(2013,14,1)], [2, 3, 4, 3, 2]) = 0
val number_in_months_ch3 = number_in_months_challenge([(2013,12,1), (2013,1,1),(2013,3,1),(2013,4,1)], []) = 0
val number_in_months_ch4 = number_in_months_challenge([], [2, 3, 4, 3, 2]) = 0
val dates_in_months_ch1 = dates_in_months_challenge([(2012,2,2),(2012,1,2),(2012,1,12),(2012,3,2),(2012,2,2),(2012,3,2),(2012,2,2)], [1, 5, 1]) = [(2012,1,2), (2012,1,12)]
val dates_in_months_ch2 = dates_in_months_challenge([(2012,5,2),(2012,4,2),(2012,1,12),(2012,3,2),(2012,2,2),(2012,3,2),(2012,2,2)], [1, 5, 1, 5]) = [(2012,1,12), (2012,5,2)]
val dates_in_months_ch3 = dates_in_months_challenge([(2012,5,2),(2012,4,2),(2012,1,12),(2012,3,2),(2012,2,2),(2012,3,2),(2012,2,2)], [7, 8, 9, 8, 9]) = []
val reasonable_date1 = reasonable_date((2012,2,20)) = true
val reasonable_date2 = reasonable_date((2012,2,29)) = true
val reasonable_date3 = reasonable_date((2013,2,29)) = false
val reasonable_date4 = reasonable_date((2012,4,50)) = false
