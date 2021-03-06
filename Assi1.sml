fun is_older(date1 : int*int*int, date2 : int*int*int) =
    ((#1 date1)*10000 + (#2 date1)*100 + (#3 date1) < 
     (#1 date2)*10000 + (#2 date2)*100 + (#3 date2))

fun number_in_month(dates : (int*int*int) list, month : int) =
    if null dates
    then 0
    else let fun retVal(v1 : int) =
		 if v1 = month then 1 else 0
	 in 
	     retVal(#2 (hd dates)) + number_in_month(tl dates, month)
	 end

fun number_in_months(dates : (int*int*int) list, months : int list) =
    if null months
    then 0    
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

fun dates_in_month(dates : (int*int*int) list, month : int) = 
    if null dates
    then []
    else if #2 (hd dates) = month
    then (hd dates):: dates_in_month(tl dates, month)
    else dates_in_month(tl dates, month)

fun dates_in_months(dates : (int*int*int) list, months : int list) = 
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

fun get_nth(strings : string list, num : int) = 
let
    val iter = 1
in  if iter = num
    then hd strings
    else get_nth(tl strings, num - iter)
end

fun date_to_string(date : (int*int*int)) =
let 
    val months_st = ["January", "February", "March", "April", "May", "June", 
		 "July", "August", "September", "October", "November", "December"]
in
    get_nth(months_st, #2 date) ^ " "    
    ^ Int.toString(#3 date) ^ ", " 
    ^ Int.toString(#1 date)
end

fun number_before_reaching_sum(sum : int, numbs : int list) = 
if hd numbs >= sum
then 0 
else number_before_reaching_sum(sum - hd numbs, tl numbs) + 1

fun what_month(ordday : int) =
let val day_months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
in number_before_reaching_sum(ordday, day_months) + 1
end

fun month_range(day1 : int, day2 : int) = 
if day2 < day1
then []
else what_month(day1)::month_range(day1 + 1, day2)

fun oldest(dates : (int*int*int) list) = 
if null dates
then NONE
else let val tl_dates = oldest(tl dates)
     in if isSome tl_dates andalso is_older(valOf tl_dates, hd dates)
	then tl_dates
	else SOME (hd dates)
     end

fun remove_duplicates(numbs : int list) = 
if null numbs
then []
else let fun is_in_list(num: int, nums : int list) = 
	     if null nums
	     then false
	     else if hd nums = num
	     then true
	     else is_in_list(num, tl nums)
     in if is_in_list(hd numbs, tl numbs)
	then remove_duplicates(tl numbs) 
	else hd numbs :: remove_duplicates(tl numbs)
     end

fun number_in_months_challenge(dates : (int*int*int) list, months : int list) =
let val months_d = remove_duplicates(months)
in
    if null months_d
    then 0    
    else number_in_month(dates, hd months_d) + number_in_months_challenge(dates, tl months_d)
end

fun dates_in_months_challenge(dates : (int*int*int) list, months : int list) = 
let val months_d = remove_duplicates(months)
in
    if null months_d
    then []
    else dates_in_month(dates, hd months_d) @ dates_in_months_challenge(dates, tl months_d) 
end

fun check_leap(year : int) = 
    (year mod 400 = 0) orelse 
    ((year mod 100) > 0 andalso (year mod 4) = 0)

fun get_max_month(month : int, days : int list) = 
let
    val iter = 1
in  if iter = month
    then hd days
    else get_max_month(month - iter, tl days)
end

fun reasonable_date(date : (int*int*int)) =
    (#1 date) > 0  (* check year *)
    andalso ((#2 date) > 0 andalso (#2 date) < 12) (* check month *)
    andalso (#3 date) > 0 (* check day floor *)
    andalso (
	(#3 date) <= get_max_month(#2 date,  [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]) (* check day top basic*)
	orelse ((#3 date) = 29 andalso (#2 date) = 2 andalso check_leap(#1 date)) (* check feb leapYear *)
    )


