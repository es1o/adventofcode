ExUnit.start

defmodule Day9Test do
  use ExUnit.Case
  # test "test" do
  #   assert true == true
  # end
  # # describe "Basic tests" do
  # #   test 'Stop When 99' do
  # #     input = [99]
  # #     id = Day9.solve2([99],0,1,0)
  # #     assert id == 1
  # #   end
  # # end

  # describe "opcode 01 tests" do
  #   test "test in position mode" do
  #     input = [1,1,2,7,4,8,99,8,0]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 3
  #   end
  #   test "test in immetiade mode" do
  #     input = [101,1,2,7,4,8,99,8,0]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 3
  #   end
  #   test "test in relative mode" do
  #     input = [20001,1,2,7,4,8,99,6,0]
  #     id = Day9.solve2(input, 0, 1, 1)
  #     assert id == 3
  #   end
  #   test "test in relative mode 2" do
  #     input = [2001,1,2,7,4,8,99,8,0]
  #     id = Day9.solve2(input, 0, 1, 1)
  #     assert id == 8
  #   end
  # end
  # describe "opcode 02 tests" do
  #   test "test in position mode" do
  #     input = [2,2,3,7,4,8,99,8,0]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 21
  #   end
  #   test "test in immetiade mode" do
  #     input = [102,5,2,7,4,8,99,8,0]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 10
  #   end
  #   test "test in relative mode" do
  #     input = [20002,5,2,7,4,8,99,6,2]
  #     id = Day9.solve2(input, 0, 1, 1)
  #     assert id == 16
  #   end
  #   test "test in relative mode 2" do
  #     input = [2002,2,2,7,4,8,99,8,0]
  #     id = Day9.solve2(input, 0, 1, 1)
  #     assert id == 14
  #   end
  # end

  # describe "opcode 03 tests" do
  #   test "test in position mode" do
  #     input = [3,5,4,6,99,6,0]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 1
  #   end
  #   test "test in immetiade mode" do
  #     # input = [103,3,99,666]
  #     input = [103,6,4,6,99,6,0]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 1
  #   end
  #   test "test in relative mode" do
  #     # input = [203,1,99,666]
  #     input = [203,5,4,6,99,6,0]
  #     id = Day9.solve2(input, 0, 1, 1)
  #     assert id == 1
  #   end
  # end
  # describe "opcode 04 tests" do
  #   test "test in position mode" do
  #     input = [4,3,99,666]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 666
  #   end
  #   test "test in immetiade mode" do
  #     input = [104,3,99,666]
  #     id = Day9.solve2(input, 0, 1, 0)
  #     assert id == 3
  #   end
  #   test "test in relative mode" do
  #     input = [204,1,99,666]
  #     id = Day9.solve2(input, 0, 1, 2)
  #     assert id == 666
  #   end
  # end
  describe "opcode 05 tests" do
    test "test in position mode - basic - jump" do
      # input = [5,11,5,1,2,3,10,4,10,99,11,0]
      input = [5,2,4,99,3]
      id = Day9.solve2(input, 0, 1, 0)
      assert id == 1
    end
    test "test in position mode - basic - not to jump" do
      # input = [5,11,5,1,2,3,10,4,10,99,11,0]
      input = [5,4,6,99,0]
      id = Day9.solve2(input, 0, 1, 0)
      assert id == 1
    end
    test "test in position mode - advenced" do
      input = [5,11,11,1,2,10,12,4,11,99,11,3,11]
      id = Day9.solve2(input, 0, 1, 0)
      assert id == 22
    end
    test "test in position mode - advenced - not to jump" do
      input = [5,11,11,1,2,10,12,4,11,99,11,0,11]
      id = Day9.solve2(input, 0, 1, 0)
      assert id == 22
    end
    test "test in immetiade mode - advanced" do
      input = [105,11,11,1,2,10,12,4,11,99,11,3,11]
      id = Day9.solve2(input, 0, 1, 0)
      assert id == 22
    end
    # test "test in relative mode" do
    #   input = [204,1,99,666]
    #   id = Day9.solve2(input, 0, 1, 2)
    #   assert id == 666
    # end
  end

  describe "example tests from aoc website" do
    
  end
end