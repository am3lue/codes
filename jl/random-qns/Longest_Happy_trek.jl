function  longest_happy_Streak(days)
streak = 0
	for i in days
		if lowercase(i) == "yes" || lowercase(i) == "y"
			streak += 1
		end
	end

	return streak
end

print("The Longest Happy streak is: ",longest_happy_Streak(["yes","no","yes","yes","no","yes"]))
