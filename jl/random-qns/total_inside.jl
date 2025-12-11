function group_cum(values, group_id)
    sums = []
    for i in 1: 1 :sizeof(values)
        if occursin(group_id[i], sums)
            sums[group_id[i]] += values[i]
        else
            push!(sums, values)
        end
    end

    return sums
end

value = [10, 20, 15, 30, 5, 25, 40]
group_id= [1, 2, 1, 2, 3, 1, 2]
println(group_cum(values,group_id))
