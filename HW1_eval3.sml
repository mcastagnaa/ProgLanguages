(* 1 *)
fun get_year(date : int * int * int) = #1 date
fun get_month(date : int * int * int) = #2 date
fun get_day(date : int * int * int) = #3 date

fun is_older(former : int * int * int, latter : int * int * int) =
    get_year(former) < get_year(latter) orelse
    get_year(former) = get_year(latter) andalso (
        get_month(former) < get_month(latter) orelse
        get_month(former) = get_month(latter) andalso
            get_day(former) < get_day(latter))

(* 2 *)
fun number_in_month(dates : (int * int * int) list, month : int) =
    if null dates
    then 0
    else
        let
            val tl_number_in_month = number_in_month(tl dates, month)
        in
            if month = get_month(hd dates)
            then tl_number_in_month + 1
            else tl_number_in_month
        end

(* 3 *)
fun number_in_months(dates : (int * int * int) list, months : int list) =
    if null months
    then 0
    else number_in_month(dates, hd months) + number_in_months(dates, tl months)

(* 4 *)
fun dates_in_month(dates : (int * int * int) list, month : int) =
    if null dates
    then []
    else
        let
            val tl_dates_in_month = dates_in_month(tl dates, month)
        in
            if month = get_month(hd dates)
            then hd dates :: tl_dates_in_month
            else tl_dates_in_month
        end

(* 5 *)
fun dates_in_months(dates : (int * int * int) list, months : int list) =
    if null months
    then []
    else dates_in_month(dates, hd months) @ dates_in_months(dates, tl months)

(* 6 *)
fun get_nth(strs : 'a list, i : int) =
    if i = 1
    then hd strs
    else get_nth(tl strs, i - 1)

(* 7 *)
val month_names = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
fun date_to_string(date : int * int * int) =
    get_nth(month_names, get_month(date)) ^ " " ^ Int.toString(get_day(date)) ^ ", " ^ Int.toString(get_year(date))

(* 8 *)
fun number_before_reaching_sum(sum : int, items : int list) =
    if sum <= hd items
    then 0
    else 1 + number_before_reaching_sum(sum - hd items, tl items)

(* 9 *)
val month_sizes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
fun what_month(day_of_year : int) =
    1 + number_before_reaching_sum(day_of_year, month_sizes)

(* 10 *)
fun month_range(day1 : int, day2 : int) =
    if day1 > day2
    then []
    else what_month(day1) :: month_range(day1 + 1, day2)

(* 11 *)
fun oldest(dates : (int * int * int) list) =
    if null dates
    then NONE
    else
        let
            fun oldest_nonempty(dates : (int * int * int) list) =
                if null (tl dates)
                then hd dates
                else
                    let
                        val tl_oldest = oldest_nonempty(tl dates)
                    in
                        if is_older(tl_oldest, hd dates)
                        then tl_oldest
                        else hd dates
                    end
        in
            SOME (oldest_nonempty(dates))
        end

(* 12 *)
fun exists(set : int list, num : int) =
    if null set
    then false
    else
        if num = hd set
        then true
        else exists(tl set, num)

fun deduplicate(items : int list) =
    if null items
    then []
    else
        let
            val tl_result = deduplicate(tl items)
        in
            if exists(tl_result, hd items)
            then tl_result
            else hd items :: tl_result
        end

fun number_in_months_challenge(dates : (int * int * int) list, months : int list) =
    number_in_months(dates, deduplicate(months))

fun dates_in_months_challenge(dates : (int * int * int) list, months : int list) =
    dates_in_months(dates, deduplicate(months))

(* 13 *)
fun is_divisible_by(a : int, b : int) = (a mod b) = 0

fun is_leap_year(year : int) =
    is_divisible_by(year, 4) andalso not(
        is_divisible_by(year, 100) andalso not(
            is_divisible_by(year, 400)))
    
fun get_month_size(month : int, leap : bool) =
    if month = 2
    then if leap then 29 else 28
    else get_nth(month_sizes, month)

fun reasonable_date(date : int * int * int) =
    get_year(date) > 0 andalso
    get_month(date) >= 1 andalso get_month(date) <= 12 andalso
    get_day(date) >= 1 andalso get_day(date) <= get_month_size(get_month(date), is_leap_year(get_year(date)))
