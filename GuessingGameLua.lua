--[[

Christopher Lee, GuessingGameLua, 9/22/2025

This game generates a random number and expects the user to the number within 7 guesses.
Tells user if they are correct, or if guess is too high or low. Asks if user wants to
play again after they win or lose.

]]

-- Function for player to guess random number, displays win/lose, and too high/low.
local function guessNumber(randNum, maxGuesses)
    local guesses = maxGuesses
    local guessing = true

    while guessing do
        print("\nYou have " .. guesses .. " chances to guess the random number.")
        io.write("Guess: ")
        local userGuess = tonumber(io.read())

        while not userGuess do
            io.write("Invalid input. Please enter a valid number: ")
            userGuess = tonumber(io.read())
        end

        if userGuess == randNum then
            print("\nYou win!")
            guessing = false
        elseif guesses == 1 then
            print("\nYou lose! The correct number was " .. randNum .. "!")
            guessing = false
        elseif userGuess > randNum then
            print("Too high!")
        elseif userGuess < randNum then
            print("Too low!")
        end

        guesses = guesses - 1
    end
end

-- function to ask if user wants to play again
local function playAgain()
    io.write("\nDo you wish to play again? 'y' for yes, or 'n' for no: ")
    local answer = string.lower(io.read())

    while answer ~= 'y' and answer ~= 'n' do
        io.write("Invalid input. Please enter 'y' for yes, or 'n' for no: ")
        answer = string.lower(io.read())
    end

    print("")

    return answer
end

-- main function/game loop
math.randomseed(os.time())
local isRunning = 'y'
local MIN_NUM = 1
local MAX_NUM = 100
local MAX_GUESSES = 7

print("\nWelcome! I'm thinking of a random number between " .. MIN_NUM .. " and " .. MAX_NUM .. "!")

while isRunning == 'y' do
    local randNum = math.random(MIN_NUM, MAX_NUM)

    guessNumber(randNum, MAX_GUESSES)
    isRunning = playAgain()
end

print("**Thank you for playing!**\n")
