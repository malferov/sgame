local module = {}

local Questions = {

	{ Question = "What is 150% of 100?",
		Options = {"150","50","100","200"},
		RightAnswer = 1},
	{ Question = "What is 8 divided by 2?",
		Options = {"4","16","6","10"},
		RightAnswer = 1},
	{ Question = "What is the next number in the sequence",
		Options = {"9","10","12","11"},
		RightAnswer = 2},
	{ Question = "If you have 5 apples and you eat 2, how many are left?",
		Options = {"3","7","5","2"},
		RightAnswer = 1},
	{ Question = "What is the sum of 20 and 15?",
		Options = {"35","30","25","40"},
		RightAnswer = 1},
	{ Question = "Which number is smaller, 0 or -1?",
		Options = {"0","-1","Both are equal","Cannot be determined"},
		RightAnswer = 2},
	{ Question = "What is 10 times 10?",
		Options = {"100","1000","10","20"},
		RightAnswer = 1},
	{ Question = "If a dozen eggs cost ?240, what is the cost of one egg?",
		Options = {"?20","?40","?30","?60"},
		RightAnswer = 1},
	{ Question = "What is the square root of 81?",
		Options = {"7","9","8","10"},
		RightAnswer = 2},
	{ Question = "How many sides does a hexagon have?",
		Options = {"5","6","7","8"},
		RightAnswer = 2},
	{ Question = "What is 7 subtracted from 100?",
		Options = {"93","107","97","103"},
		RightAnswer = 1},
	{ Question = "If you divide 50 by half and add 20, what do you get?",
		Options = {"120","100","45","70"},
		RightAnswer = 1},
	{ Question = "What is the product of 12 and 12?",
		Options = {"144","124","134","154"},
		RightAnswer = 1},
	{ Question = "Which number is an odd number?",
		Options = {"22","18","15","30"},
		RightAnswer = 3},
	{ Question = "What is 45 minutes as a fraction of an hour?",
		Options = {"1/2","1/4","3/4","2/3"},
		RightAnswer = 3},
	{ Question = "What is the value of 2 to the power of 5?",
		Options = {"10","32","25","16"},
		RightAnswer = 2},
	{ Question = "What is the result of 19 minus 9?",
		Options = {"10","8","11","9"},
		RightAnswer = 1},
	{ Question = "How many zeros are in the number one thousand?",
		Options = {"2","3","4","1"},
		RightAnswer = 2},
	{ Question = "What is the average of 10, 20, and 30?",
		Options = {"20","25","15","30"},
		RightAnswer = 1},
	{ Question = "If a rectangle’s length is twice its width, and the perimeter is 60 cm, what is the width?",
		Options = {"15 cm","20 cm","10 cm","25 cm"},
		RightAnswer = 3},
	{ Question = "What is 1000 multiplied by 0?",
		Options = {"1000","0","1","10"},
		RightAnswer = 2},
	{ Question = "What is the largest two-digit prime number?",
		Options = {"97","93","89","91"},
		RightAnswer = 1},
	{ Question = "What comes next in the series",
		Options = {"32","24","18","28"},
		RightAnswer = 1},
	{ Question = "If you buy 4 toys for $120 each, what is the total cost?",
		Options = {"$480","$500","$450","$400"},
		RightAnswer = 1},
	{ Question = "What is the difference between the 50 and 41 ?",
		Options = {"9","8","10","7"},
		RightAnswer = 1},
	{ Question = "What fraction represents half of a quarter?",
		Options = {"1/8","1/4","1/2","1/6"},
		RightAnswer = 1},
	{ Question = "How many minutes are there in three and a half hours?",
		Options = {"210","180","150","200"},
		RightAnswer = 1},
	{ Question = "What is 5% of 200?",
		Options = {"10","15","20","5"},
		RightAnswer = 1},
	{ Question = "If a train travels 60 kilometers in 1 hour, how long does it take to travel 180 kilometers?",
		Options = {"2 hours","3 hours","4 hours","1.5 hours"},
		RightAnswer = 2},
	{ Question = "What is the next prime number after 5?",
		Options = {"6","7","8","9"},
		RightAnswer = 2},
	{ Question = "How many Hours in 150 miniutes ?",
		Options = {"3..5","4","2.5","3"},
		RightAnswer = 3},
	{ Question = "If your school is 10 km is far from your house. and your speed is 5 km/ hr. how much time will you reach school?",
		Options = {"3 hr","1 hr","2 hr","3.5 hr"},
		RightAnswer = 3},
	{ Question = "What is the 4th multiple of 10 ?",
		Options = {"30","40","50","10"},
		RightAnswer = 2},
	{ Question = "What is the highest common factor of 10 and 15 ?",
		Options = {"5","10","15","20"},
		RightAnswer = 1}
	
}

function module.nextQuestion(player)

	local current = player.leaderstats.Question
	current.Value += 1

	local question = Questions[current.Value]
	local frame = player.PlayerGui.quiz.frame

	-- symbol # counts a length
	-- print("question length: " .. #question.Question)
	local size = 40 -- default text size
	if #question.Question > 25 then
		size = 20 -- size if long question 
	end

	frame.banner.Text = question.Question
	frame.banner.TextSize = size
	
	for i = 1, 4 do
		local ans = frame:FindFirstChild("ans" .. i)
		ans.Text = question.Options[i]
		--print("ans: "..ans.Text)
	end

	frame.Visible = false
	frame.Visible = true
end

function module.checkQuestion(player, answer)
	local current = player.leaderstats.Question.Value
	return Questions[current].RightAnswer == answer 
end

return module