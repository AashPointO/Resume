function getBodyPargs(role, officialCompanyName, colloqCompanyName, companyGoal)

	p1 = "I am writing to express my interest in " ..  role .. " role at " ..  officialCompanyName .. ". I am a Computer Engineering graduate from UC Davis, looking to strengthen my abilities in hardware and software design, as well as to contribute my passion and curiosity " .. companyGoal .. "."


	p2 = "During my junior year, I began taking upper-division courses that were directly applicable to solving real engineering hurdles to create tangible pieces of software and hardware. My passion for solving technical problems is reflected in these last two years, in which I maintained a \\textbf{3.75/4.00 GPA}. Many of the courses I have taken establish my engineering technical proficiency, and are directly applicable to a firmware engineering role at " ..  colloqCompanyName .. ". Furthermore, I believe this GPA to be indicative of the quality of work I intend on bringing to this company."


	p3 = "Beyond academic and professional obligations, my curiosity has driven me to read a number of relevant texts in my free time, including books on classic shell scripting, writing cleaner code, Embedded Linux Programming, and Machine Learning in Python. Throughout my growth as an engineer, I have become confident that I possess the curiosity and drive to become an expert in a subfield of computer science and electrical engineering, and would love the chance to pursue my passion at " .. colloqCompanyName .. "."

	return p1, p2, p3

end

function inputRole() 
	io.write("... interest in the <ROLE> role at ... \n" ..
		"ROLE= ")
	role = io.read("*l")
	
	-- handling optional case and fixing grammar.
	if role == "" then 
		role = "an embedded/firmware engineering"
	else 
		role = "the " .. role

	end

	return role
end


function inputCompanyGoal() 
	io.write("\n... contribute my passion and curiosity towards <COMPANY_GOAL>.\" \n" ..
		"COMPANY_GOAL= ")
	companyGoal = io.read("*l")

	-- handling optional case and fixing grammar.
	if companyGoal == "" then 
		companyGoal = "to this company"
	else 
		companyGoal = "towards " .. companyGoal
	end

	return companyGoal
end

function inputCompanyName()
	io.write("\nOFFICIAL_COMPANY_NAME= ")
	officialCompanyName = io.read("*l")
	officialCompanyName = string.gsub(officialCompanyName, "%.", "") -- Removing any periods (if there are any)

	io.write("\nCOLLOQUIAL_COMPANY_NAME= ")
	colloqCompanyName = io.read("*l")
	colloqCompanyName = string.gsub(colloqCompanyName, "%.", "") -- Removing any periods (if there are any)

	if (colloqCompanyName == "" and officialCompanyName == "") then
		colloqCompanyName = "this company"
		officialCompanyName   = "this company"

	elseif officialCompanyName == "" then
		officialCompanyName = colloqCompanyName 

	elseif colloqCompanyName == "" then
		colloqCompanyName = officialCompanyName

	end

	return officialCompanyName, colloqCompanyName
end

function getTextInputs() 

	role					= inputRole()
	officialCompanyName, colloqCompanyName 	= inputCompanyName()
	companyGoal 				= inputCompanyGoal()
	
	return role, officialCompanyName, colloqCompanyName, companyGoal

end

-- ACTUAL INTERFACE:
function generateBodyText() 
	io.write("\n\nFill in the variables (leave as many blank as you want).\n\n");

	role, officialCompanyName, colloqCompanyName, companyGoal =  getTextInputs()

	p1, p2, p3 = getBodyPargs(role, officialCompanyName, colloqCompanyName, companyGoal)

	return p1, p2, p3 
end

