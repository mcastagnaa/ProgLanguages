fun is_older (d1 : int*int*int, d2 : int*int*int) =
    if (#1 d1) < (#1 d2) 
    then true
    else if (#1 d1) = (#1 d2) andalso (#2 d1) < (#2 d2)
    then true
    else if (#1 d1) = (#1 d2) andalso (#2 d1) = (#2 d2) andalso (#3 d1) < (#3 d2)
    then true
    else false


fun number_in_month (ds : (int*int*int) list, mn : int) =
    if null ds 
    then 0
    else if #2 (hd ds) = mn
    then 1 + number_in_month (tl ds, mn)
    else number_in_month (tl ds, mn)

fun number_in_months (ds : (int*int*int) list, mns : int list) =
		     if null mns 
		     then 0
		     else number_in_month (ds, hd mns) + number_in_months (ds, tl mns)

fun dates_in_month (ds : (int*int*int) list, mn : int) =
		   if null ds
		   then []
		   else if #2 (hd ds) = mn
		   then hd ds :: dates_in_month(tl ds, mn)
		   else dates_in_month (tl ds, mn)

fun dates_in_months (ds : (int*int*int) list, mns : int list) =
		     if null mns
		     then []
		     else dates_in_month (ds, hd mns) @  dates_in_months (ds, tl mns)

fun get_nth (strs : string list, n : int) =
    if n = 1
    then hd strs
    else get_nth (tl strs, n - 1)

fun date_to_string (date : int*int*int) =
    let val months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
    in
	get_nth(months, #2 date) ^ " " ^ Int.toString(#3 date) ^ ", " ^ Int.toString(#1 date)
    end

fun number_before_reaching_sum (sum : int, numbers : int list) =
    if hd numbers >= sum
    then 0
    else 1 + number_before_reaching_sum (sum - hd numbers, tl numbers)

fun what_month (day : int) = 
    if day < 1 orelse day > 365
    then 0
    else 
	let val month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
	in
	    number_before_reaching_sum (day, month) + 1
	end

fun month_range (day1 : int, day2 : int) =
		if day1 > day2
		then []
		else what_month (day1) :: month_range (day1 + 1, day2)

fun oldest (datelist : (int * int * int) list) = 
    if null datelist
    then NONE
    else let
	fun oldest_nonempty (datelist : (int * int * int) list) =
	    if null (tl datelist)
	    then hd datelist
	    else let	
		val tl_ans = oldest_nonempty(tl datelist)
	    in
		if is_older(hd datelist, tl_ans)
		then hd datelist
		else tl_ans
	    end
    in
	SOME (oldest_nonempty (datelist))
    end

fun number_in_months_challenge (datelist : (int * int * int) list, mnlist : int list) = 
				 if null datelist
				 then 0
				 else let
				     fun isunique (months : int list, month : int) =
					 if null months
					 then true
					 else if hd months = month
					 then false
					 else isunique (tl months, month)
				 in
				     let fun buildlist (mns : int list) = 
					 if null mns
					 then []
					 else if isunique (tl mns, hd mns)
					 then hd mns :: buildlist(tl mns)
					 else buildlist(tl mns)
				     in
					 number_in_months(datelist, buildlist (mnlist))
				     end
				 end

					 
					    



 



