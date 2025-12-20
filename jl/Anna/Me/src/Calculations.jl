module Calculations

using Dates

export days_until, days_since, get_cycle_stats

"""
    days_until(target_date::Date)

Returns the number of days from today until the target date.
"""
function days_until(target_date::Date)
    today_date = today()
    return (target_date - today_date).value
end

"""
    days_since(start_date::Date)

Returns the number of days elapsed since the start date.
"""
function days_since(start_date::Date)
    today_date = today()
    return (today_date - start_date).value
end

"""
    get_cycle_stats(cycle_start::Date, cycle_length::Int, period_duration::Int)

Returns a NamedTuple with cycle statistics.
"""
function get_cycle_stats(cycle_start::Date, cycle_length::Int, period_duration::Int)
    today_date = today()
    
    # Calculate key dates
    period_end_date = cycle_start + Day(period_duration)
    next_period_start = cycle_start + Day(cycle_length)
    
    # 1. Is the period currently active?
    is_period_active = today_date <= period_end_date
    
    # 2. Days remaining in period (if active)
    days_left_in_period = is_period_active ? (period_end_date - today_date).value : 0
    
    # 3. Days until next period
    days_until_next = (next_period_start - today_date).value
    
    return (
        is_period_active = is_period_active,
        days_left_in_period = days_left_in_period,
        days_until_next = days_until_next,
        next_start_date = next_period_start
    )
end

end
