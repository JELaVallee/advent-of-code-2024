namespace :aoc24 do
    namespace :day02 do
        desc "Run step 01 of day 02"
        task :step01 do
            puts "Running Advent of Code 2024: Day 02, Step 01!"
            safe_count = 0
            # Open the file and parse each line
            File.foreach('./data/day02_step01.txt') do |line|
                levels = line.split.map(&:to_i)
                safe_count += 1 if safe?(levels)
            end

            puts "The result is: #{safe_count}"
        end

        desc "Run step 02 of day 02"
        task :step02 do
            puts "Running Advent of Code 2024: Day 02, Step 02!"
        end
    end
end

def safe?(level_set)
    puts level_set.inspect

    is_safe = consistently_sorted?(level_set) && changes_in_range?(level_set)      

    puts "Is safe: #{is_safe}"
    return is_safe
end

def consistently_sorted?(array)
    return true if array.size <= 1 # An empty or single-element array is trivially sorted

    ascending = array.each_cons(2).all? { |a, b| a <= b }
    descending = array.each_cons(2).all? { |a, b| a >= b }

    ascending || descending
end

def changes_in_range?(array)
    return true if array.size <= 1 # An empty or single-element array is trivially sorted
    
    array.each_cons(2) do |a,b|
      level_change = (a - b).abs
      return false unless level_change >= 1 && level_change <=3
    end

    return true
end