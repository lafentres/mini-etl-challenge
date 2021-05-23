# Mini ETL

This program reads comma-separated lines from standard input, 
parses them, transforms the data, and prints the transformation 
to standard output.

Each comma-separated line represents an item, its ID, 
and the ID of its parent item.

The input is guaranteed to be well formed, meaning:
  - There is a single root item; there are no orphans.
  - There are no cycles.
  - There are no commas within an item name, ID, or parent ID.
  - No item is duplicated.
  - No two items have the same ID.
  - The root of the hierarchy has a parent equal to "nil"
  - The input does not have a header row

## Ruby version

2.5.1

## Usage

You can run this program two ways:

  1. Provide a file of lines, each separate by a newline, 
  where each line is in the format 
  `<ITEM NAME>,<ITEM ID>,<ITEM'S PARENT ID>`
  ```
  ruby mini_etl.rb sample_input_space.rb
  ```

  OR

  2. Run the program and type each line in the console, 
  where each line is in the format 
  `<ITEM NAME>,<ITEM ID>,<ITEM'S PARENT ID>`. 
  When you are done entering lines, send the EOF signal, 
  CTRL+D.
    ```
  ruby mini_etl.rb
  feelings,98473,nil
  ...
  sad,what-a-strange-id,98473
  ^D
  ```

  ## Things left to improve

  I followed the guidelines and only spent two hours on this, 
  so that means I ran out of time to write tests and 
  double-check the efficiency of my solution. 

  Here are a few things I would research and improve with more time:
    - [ ] Add tests, in particular for edge cases, larger inputs, etc
    - [ ] Double-check that the process used is the most efficient
    - [ ] Refactor to get rid of global variable
    - [ ] Add a helpful prompt for users providing input through
  the console
    - [ ] Add more checks and error handling around file reading
    - [ ] Add a help/usage command
