# mini_etl.rb
#
# This program reads comma-separated lines from standard input, 
# parses them, transforms the data, and prints the transformation 
# to standard output.
#
# Each comma-separated line represents an item, its ID, 
# and the ID of its parent item.
#
# The input is guaranteed to be well formed, meaning:
#   - There is a single root item; there are no orphans.
#   - There are no cycles.
#   - There are no commas within an item name, ID, or parent ID.
#   - No item is duplicated.
#   - No two items have the same ID.
#   - The root of the hierarchy has a parent equal to "nil"
#   - The input does not have a header row

# Globally accessible variable for storing 
# all processed input items
$children_of = {}

# Method to print the item and any of its children
def print_item(level:, current_item:)
  # Print the current item
  tabs = "\t" * level
  puts tabs + '+ ' + current_item[:name]

  # Print the current item's children
  children = $children_of[current_item[:id]]
  if children && children.length > 0
    children.each do |child|
      print_item(
        level: level + 1, 
        current_item: child
      )
    end
  end
end

# Get input from standard input, file or console
input = if ARGV.length > 0
          # Read input from the file
          File.read(ARGV[0])
        else
          # Read input from the console
          STDIN.read
        end

# Split the input on newlines to get each row
rows = input.split("\n")

# Split each row on the comma to get
# the item, the item's ID, and the item's
# parent's ID
rows = rows.map { |row| row.split(',') }

# Process and store each input row
rows.each do |row|
  item_name = row[0]
  item_id = row[1]
  parent_id = row[2]

  $children_of[parent_id] ||= []
  $children_of[parent_id].push({ name: item_name, id: item_id })
end

# The root item has a parent_id of "nil"
# and it is guarenteed that there is only one
root_item = $children_of["nil"].first

# Print all of the items
print_item(
  level: 0,
  current_item: root_item
)
