--[[

Christopher Lee, GuessingGameLua, 9/22/2025

This game generates a random number and expects the user to the number within 7 guesses.
Tells user if they are correct, or if guess is too high or low. Asks if user wants to
play again after they win or lose.

]]

-- Function for player to guess random number, displays win/lose, and too high/low.
local function IsGuessing(randNum)

    local guesses = 7
    local isGuessing = true

    while isGuessing == true do
        print("You have " .. guesses .. " chances to guess the random number")
        io.write("Guess: ")
        local userGuess = tonumber(io.read())

        while userGuess == nil do
            print("Invalid input. Please enter a valid number.")
            userGuess = tonumber(io.read())
        end

        if userGuess ~= randNum and guesses == 1 then
            print("You lose!")
            isGuessing = false
        elseif userGuess > randNum then
            print("Too high!")
        elseif userGuess < randNum then
            print("Too low!")
        else
            print("You win!")
            isGuessing = false
        end

        guesses = guesses - 1

    end

end

-- function to ask if user wants to play again
local function PlayAgain()
    print("\nDo you wish to play again? 'y' for yes, or 'n' for no")
    local answer = string.lower(io.read())

    while answer ~= 'y' and answer ~= 'n' do
        print("Invalid input. Please enter 'y' for yes, or 'n' for no")
        answer = string.lower(io.read())
    end
    return answer
end

-- main function/game loop
math.randomseed(os.time())
local isRunning = 'y'
local MAX_NUM = 100

while isRunning == 'y' do

    IsGuessing(math.random(MAX_NUM))
    isRunning = PlayAgain()


end
