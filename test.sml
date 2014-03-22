fun number_before_reaching_sum (limit : int, ints : int list) =
    let
        fun aux (acc : int, n : int, rest : int list) =
            let val nacc = acc + hd rest in
                if nacc >= limit
                then n
                else aux(nacc, n+1, tl rest)
            end
    in
        aux(0,0,ints)
    end

fun what_month (doy : int) =
    let
        val days_in_month = [31,28,31,30,31,30,31,31,30,31,30,31]
    in
        number_before_reaching_sum(doy, days_in_month) + 1
    end


fun month_range (day1 : int, day2 : int) =
    if day1 = day2
    then [what_month(day1)]
    else what_month(day1) :: month_range(day1+1, day2)
