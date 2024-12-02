namespace :aoc24 do
    namespace :day01 do
        desc "Run step 01 of day 01"
        task :step01 do
            puts "Running Advent of Code 2024: Day 01, Step 01!"

            rolling_sum = 0
            coordinates1 = []
            coordinates2 = []

            # Open the file and parse each line
            File.foreach('./data/day01_step01.txt') do |line|
                num1, num2 = line.split.map(&:to_i)

                coordinates1 << num1
                coordinates2 << num2
            end

            coordinates1.sort!
            coordinates2.sort!

            coordinates1.each_with_index do |num1, index|
              num2 = coordinates2[index]
              rolling_sum += (num1 - num2).abs
            end

            puts "The result is: #{rolling_sum}"
        end

        desc "Run step 02 of day 01"
        task :step02 do
            puts "Running Advent of Code 2024: Day 01, Step 02!"
            similarity_score = 0
            coordinates1 = []
            coordinates2 = []

            # Open the file and parse each line
            File.foreach('./data/day01_step01.txt') do |line|
                num1, num2 = line.split.map(&:to_i)

                coordinates1 << num1
                coordinates2 << num2
            end

            coordinates1.sort!
            coordinates2.sort!

            coordinates1.each_with_index do |num1, index|
              count = coordinates2.count(num1)
              similarity_score += num1 * count
            end

            puts "The result is: #{similarity_score}"
        end
    end
end

